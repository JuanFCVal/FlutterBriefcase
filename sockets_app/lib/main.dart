import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sockets_app/providers/socket_provider.dart';
import 'package:sockets_app/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => SocketService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'complexDesign',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
        ),
        routes: getApplicationRoutes(),
      ),
    );
  }
}
