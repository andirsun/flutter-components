import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> opciones =[];

  _MenuProvider(){
    cargarData();
  }

  cargarData() {
    rootBundle.loadString("data/menu_opts.json").then((data){//read static resources in de directory
      print(data);
    });
  }
}

final menuProvider = new _MenuProvider();