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
  List<Band> bands = [
    Band(
        id: '1',
        name: 'Metallica',
        description: 'assets/metallica.jpg' * 1,
        votes: 5),
    Band(
        id: '2',
        name: 'Ramstein',
        description: 'assets/metallica.jpg',
        votes: 3),
    Band(id: '3', name: 'Pink Floyd', votes: 3),
  ];
  @override
  Widget build(BuildContext context) {
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
    return Dismissible(
      key: Key(banda.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        bands.remove(banda);
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
          debugPrint(banda.name);
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
    Band band = Band(
        id: (int.parse(bands.last.id) + 1).toString(),
        name: text,
        description: '',
        votes: 4);
    setState(() {
      bands.add(band);
    });
    Navigator.of(context).pop();
  }
}
