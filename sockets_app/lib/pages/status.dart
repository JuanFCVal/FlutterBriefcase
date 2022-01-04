import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sockets_app/providers/socket_provider.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketProvider = Provider.of<SocketService>(context);
    final socket = socketProvider.socket;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Estado del servidor ${socketProvider.serverStatus}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.email),
        onPressed: () {
          socket.emit('emitir-mensaje',
              {"nombre": "Juan", "mensaje": "Saludos desde Flutter"});
        },
      ),
    );
  }
}
