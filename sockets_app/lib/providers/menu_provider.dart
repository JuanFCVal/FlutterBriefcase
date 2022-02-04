import 'package:flutter/services.dart' show rootBundle; //Permite leer e json

import 'dart:convert'; //Permite acceder a las funciones de un objeto json para convertir string a map

class _MenuProvider {
  List<dynamic> opciones =
      []; //Creamos una lista vacia que va a guardar los datos
  _MenuProvider() {
    //cargarData(); //Creamos el constructor de la clase
  }

  Future<List<dynamic>> cargarData() async {
    //rootBundle nos permite acceder a un metodo que lee el json
    //Esto nos da como resultado un future por eso podemos usar el método .then
    final resp = await rootBundle.loadString('data/options.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap['data'];
    return opciones;
  }
}

final menuProvider = _MenuProvider();
