import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sockets_app/models/band.dart';
import 'package:sockets_app/providers/socket_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [];
  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on('active-bands', (data) {
      bands = (data as List).map((band) => Band.fromJson(band)).toList();
      setState(() {});
      // for (var item in data) {
      //   Band banda = Band.fromJson(item);
      //   bands.add(banda);
      // }
    });
  }

  @override
  void dispose() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.off('active-bands');
    super.dispose();
  }

  @override
  Widget build(BuildContext contex) {
    final socketProvider = Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Band Sockets App',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: socketProvider.serverStatus == ServerStatus.Online
                ? const Icon(Icons.wifi, color: Colors.green)
                : const Icon(Icons.wifi_lock, color: Colors.red),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (context, index) => _bandTile(bands[index])),
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
      onDismissed: (direction) {
        socket.socket.emit('remove-band', {"band_id": banda.id});
      },
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
        onTap: () {
          socket.socket.emit('add-vote', {"band_id": banda.id});
        },
      ),
    );
  }

  addBand() {
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
}
