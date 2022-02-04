import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Map options = {
    "Diseño básico": "basicDesign",
    "Diseño scroll": "basicDesign2",
    "Diseño compuesto": "complexDesign",
    //"Diseño compuesto 2": "compDesign2",
    "Comunicación con Sockets": "sockets"
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
            child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    title: Text(options.keys.elementAt(index)),
                    onTap: () {
                      Navigator.pushNamed(
                          context, options.values.elementAt(index));
                    },
                  );
                })),
        body: SizedBox.expand(
          child: Text(""),
        ),
      ),
    );
  }
}
