// Flutter dependencies
import 'package:flutter/services.dart' show rootBundle; //used to read static files
// Dart dependencies
import 'dart:convert';

// Private class with _NameClass
class _MenuProvider{
  // Properties
  List<dynamic> options =[];
  // Constructor
  _MenuProvider(){
    loadData();
  }
  //Future is like :Promise<>
  Future<List<dynamic>>loadData() async{
    //read static resources in de directory
    final resp = await rootBundle.loadString("data/menu_opts.json");
    Map dataMap = json.decode(resp);
    options = dataMap['rutas'];//accedo a ese paramtetro de l json
    return options;
    
    
  }
}
// Unique Instace of the class, if need to import a instance in a file just paste menuProvider
final menuProvider = new _MenuProvider();