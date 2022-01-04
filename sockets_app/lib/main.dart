import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sockets_app/pages/home.dart';
import 'package:sockets_app/pages/status.dart';
import 'package:sockets_app/providers/socket_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => SocketService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'status': (_) => StatusPage()
        },
      ),
    );
  }
}
