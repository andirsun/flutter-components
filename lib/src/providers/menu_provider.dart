import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';


class _MenuProvider{
  List<dynamic> opciones =[];

  _MenuProvider(){
    cargarData();
  }
  //un future va a resolver va a retornar la informacion dentro de los <>
  Future<List<dynamic>>cargarData() async{
    final resp= await rootBundle.loadString("data/menu_opts.json");//read static resources in de directory
      
    Map dataMap = json.decode(resp);//to handle the data of json in a object
    opciones = dataMap['rutas'];//accedo a ese paramtetro de l json
  
    return opciones;
  }
}

final menuProvider = new _MenuProvider();