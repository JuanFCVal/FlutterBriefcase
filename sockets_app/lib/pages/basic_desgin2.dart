import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicDesign2 extends StatelessWidget {
  const BasicDesign2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: const [
          Page1(),
          Page2(),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const PhotoBackGround(),
        SizedBox(
          width: double.infinity,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text("11°",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                const Text("Sábado",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600)),
                Expanded(child: Container()),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 80,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PhotoBackGround extends StatelessWidget {
  const PhotoBackGround({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage(
          "assets/images/lofi.jpg",
        ),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(197, 64, 97, 0.9),
      body: Container(
        color: Colors.black12,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: MaterialButton(
            child: Text(
              "Tap me!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              showAlert(context);
            },
          ),
        ),
      ),
    );
  }

  Widget showAlert(context) {
    return AlertDialog(
      title: const Text("Ups"),
      content: const Text("Estás en esta pantalla :)"),
      actions: [
        TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }
}
