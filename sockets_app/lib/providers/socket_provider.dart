import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;

  //Sets & Gets
  IO.Socket get socket => _socket;

  ServerStatus get serverStatus => _serverStatus;
  set serverStatus(ServerStatus value) {
    _serverStatus = value;
    notifyListeners();
  }

  SocketService() {
    _initConfig();
  }
  void _initConfig() {
    // Dart client
    _socket = IO.io('https://bands-socket-server-flutter.herokuapp.com/', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    _socket.onConnect((_) {
      serverStatus = ServerStatus.Online;
      print('connect');
    });
    _socket.onDisconnect((_) {
      serverStatus = ServerStatus.Offline;
    });
    // socket.on('nuevo-mensaje', (payload) {         //Listen a rought event
    //   print('nuevo mensaje');
    //   print("Nombre: " + payload['nombre']);
    //   print(
    //       payload.containsKey('mensaje') ? payload['mensaje'] : "Sin mensaje");
    // });
  }
}
