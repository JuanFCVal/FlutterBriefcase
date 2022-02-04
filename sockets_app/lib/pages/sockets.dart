import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:sockets_app/models/band.dart';
import 'package:sockets_app/providers/socket_provider.dart';

class SocketsPage extends StatefulWidget {
  const SocketsPage({Key? key}) : super(key: key);

  @override
  State<SocketsPage> createState() => _SocketsPageState();
}

class _SocketsPageState extends State<SocketsPage> {
  List<Band> bands = [];
  late SocketService socketProvider;
  @override
  void initState() {
    socketProvider = Provider.of<SocketService>(context, listen: false);
    socketProvider.socket.on('active-bands', (data) {
      _handleBands(data);
    });
    super.initState();
  }

  _handleBands(data) {
    bands = (data as List).map((band) => Band.fromJson(band)).toList();
    socketProvider.Bands = bands;
    setState(() {});
  }

  @override
  void dispose() {
    socketProvider.socket.off('active-bands');
    super.dispose();
  }

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Band Sockets App',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: socketProvider.serverStatus == ServerStatus.Online
                ? const Icon(Icons.wifi, color: Colors.green)
                : const Icon(Icons.wifi_lock, color: Colors.red),
          ),
        ],
      ),
      body: Column(
        children: [
          socketProvider.serverStatus != ServerStatus.Online
              ? const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Si esta función no está disponible probablemente el servidor en Heroku está offline :). Espera un momento mientras se inicia!",
                    maxLines: 3,
                  ),
                )
              : Container(),
          socketProvider.Bands.length != 0
              ? SizedBox(
                  height: 200, width: double.infinity, child: _showGraph())
              : Container(),
          Expanded(
            child: ListView.builder(
                itemCount: socketProvider.Bands.length,
                itemBuilder: (context, index) =>
                    _bandTile(socketProvider.bands[index])),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: addBand,
      ),
    );
  }

  _bandTile(Band banda) {
    final socket = Provider.of<SocketService>(context, listen: false);
    return Dismissible(
      key: Key(banda.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) =>
          socket.socket.emit('remove-band', {"band_id": banda.id}),
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: Colors.red,
        child: const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.delete, color: Colors.white)),
      ),
      child: ListTile(
          title: Text(banda.name),
          subtitle: Text(banda.description ?? ''),
          trailing: Text(banda.votes.toString()),
          onTap: () => socket.socket.emit('add-vote', {"band_id": banda.id})),
    );
  }

  addBand() {
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add new band'),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText: 'Band name',
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          MaterialButton(
            child: Text('Confirm'),
            onPressed: () => addElement(textController.text),
          ),
        ],
      ),
    );
  }

  addElement(String text) {
    final socket = Provider.of<SocketService>(context, listen: false);
    socket.socket.emit('add-band', {"name": text});
    Navigator.of(context).pop();
  }

  Widget _showGraph() {
    Map<String, double> dataMap = {};
    for (var band in socketProvider.Bands) {
      dataMap.putIfAbsent(band.name, () => band.votes.toDouble());
    }
    return PieChart(dataMap: dataMap);
  }
}
