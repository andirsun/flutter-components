// Flutter dependencies
import 'package:flutter/services.dart' show rootBundle; //used to read static files
// Dart dependencies
import 'dart:convert';


class _MenuProvider{
  // Properties
  List<dynamic> options =[];
  // Methods
  _MenuProvider(){
    cargarData();
  }
  //un future va a resolver va a retornar la informacion dentro de los <>
  Future<List<dynamic>>cargarData() async{
    //read static resources in de directory
    final resp = await rootBundle.loadString("data/menu_opts.json");
    Map dataMap = json.decode(resp);
    options = dataMap['rutas'];//accedo a ese paramtetro de l json
    return options;
  }
}

final menuProvider = new _MenuProvider();