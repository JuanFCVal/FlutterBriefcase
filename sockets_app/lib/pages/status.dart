import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sockets_app/providers/socket_provider.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketProvider = Provider.of<SocketService>(context);
    return Scaffold();
  }
}
