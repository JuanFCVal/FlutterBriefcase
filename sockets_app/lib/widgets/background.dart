import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);
  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
        stops: [0.20, 0.65],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2E305F), Color(0xff202333)]),
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
        Rectangle()
      ],
    );
  }
}

class Rectangle extends StatelessWidget {
  const Rectangle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -100,
      left: -120,
      child: Transform.rotate(
        angle: 150,
        child: Container(
          width: 350,
          height: 360,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(236, 98, 188, 1),
                Color.fromRGBO(251, 142, 172, 1)
              ])),
        ),
      ),
    );
  }
}
