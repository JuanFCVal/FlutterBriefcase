import 'package:flutter/material.dart';
import 'package:sockets_app/models/band.dart';

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
        description: 'assets/metallica.jpg',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Band Sockets App',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (context, index) => _bandTile(bands[index])),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  ListTile _bandTile(Band banda) {
    return ListTile(
      title: Text(banda.name),
      subtitle: Text(banda.description ?? ''),
      trailing: Text(banda.votes.toString()),
      onTap: () {
        debugPrint(banda.name);
      },
    );
  }
}
