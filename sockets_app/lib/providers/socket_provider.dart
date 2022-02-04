import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:sockets_app/models/band.dart';

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  List<Band> bands = [];
  late IO.Socket _socket;

  //Sets & Gets
  IO.Socket get socket => _socket;

  ServerStatus get serverStatus => _serverStatus;
  set serverStatus(ServerStatus value) {
    _serverStatus = value;
    notifyListeners();
  }

  set Bands(List<Band> bands) {
    this.bands = bands;
  }

  List<Band> get Bands {
    return bands;
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
    });
    _socket.onDisconnect((_) {
      serverStatus = ServerStatus.Offline;
    });
  }

  dispose();
}
