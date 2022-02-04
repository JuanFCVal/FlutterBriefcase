import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicDesign extends StatelessWidget {
  const BasicDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            TopImage(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: NameAndVotes(),
            ),
            ListIcons(),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
            ))
          ],
        ),
      ),
    );
  }
}

class ListIcons extends StatelessWidget {
  const ListIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Button(icon: Icons.phone, text: "CALL"),
        Button(icon: Icons.map, text: "Map"),
        Button(
          icon: Icons.gps_fixed,
          text: "Locate",
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final IconData icon;
  final String text;
  const Button({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Icon(icon, color: Colors.lightBlue),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.lightBlue),
          )
        ],
      ),
    );
  }
}

class NameAndVotes extends StatelessWidget {
  const NameAndVotes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Salar de Bolívia",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "La Paz, Bolívia",
              style: TextStyle(fontWeight: FontWeight.w300),
            )
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5,
              ),
              Text("41"),
            ],
          ),
        ),
      ],
    );
  }
}

class TopImage extends StatelessWidget {
  const TopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 200,
        child: Image(
          image: AssetImage("assets/images/landscape.jpg"),
          fit: BoxFit.cover,
        ));
  }
}
