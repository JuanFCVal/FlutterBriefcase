import 'dart:math';
import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sockets_app/providers/menu_provider.dart';
import 'package:sockets_app/widgets/background.dart';
import 'package:sockets_app/widgets/bottom_nav_bar.dart';

class ComplexDesing extends StatefulWidget {
  @override
  State<ComplexDesing> createState() => _ComplexDesingState();
}

class _ComplexDesingState extends State<ComplexDesing> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Body(),
        ],
      ),
      bottomNavigationBar: bottomNaviBar(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(padding: EdgeInsets.only(top: 30, left: 20), child: _Title()),
      Expanded(
        child: FutureBuilder(
          future: menuProvider.cargarData(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: _getCardItems(snapshot.data),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      )
    ]);
  }
}

List<Widget> _getCardItems(dynamic options) {
  List<Widget> elements = [];
  for (var i = 0; i < options.length; i++) {
    final cardElement = singleCard(
      icon: Icons.app_blocking,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      text: options[i]['name'],
      route: menuProvider.opciones[i]['route'],
    );
    elements.add(cardElement);
  }
  return elements;
}

class singleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final String route;
  const singleCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(62, 66, 107, 0.7),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: color,
                    child: Icon(
                      icon,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      text,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Juan Francisco Cevallos",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            Text("Developer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ))
          ],
        ),
      ),
    );
  }
}
