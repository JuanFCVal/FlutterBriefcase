import 'package:flutter/material.dart';

class QrPage extends StatelessWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 3,
        title: Text("Detector de códigos QR"),
        backgroundColor: Color(0xff202333),
      ),
    );
  }
}
