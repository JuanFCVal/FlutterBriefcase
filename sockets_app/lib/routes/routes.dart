import 'package:flutter/material.dart';
import 'package:sockets_app/pages/basic_desgin2.dart';
import 'package:sockets_app/pages/basic_design.dart';
import 'package:sockets_app/pages/complex_design.dart';
import 'package:sockets_app/pages/home.dart';
import 'package:sockets_app/pages/qr_page.dart';
import 'package:sockets_app/pages/sockets.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'sockets': (_) => const SocketsPage(),
    'home': (_) => HomePage(),
    'basicDesign': (_) => const BasicDesign(),
    'basicDesign2': (_) => const BasicDesign2(),
    'complexDesign': (_) => ComplexDesing(),
    'qrPage': (_) => const QrPage()
  };
}
