import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart'; 
import 'package:icons_helper/icons_helper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ), 
      body:_createList(),
    );
  }
      
  Widget _createList() {
    // Future builder allow to wait a fetch data befsore create a widget without data
    return FutureBuilder(
      // future is the method to wait until build the widget
      future: menuProvider.loadData(),
      initialData: [],
      //exceute after future finish
      builder:(context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children:_createListItems(snapshot.data,context),
        );
      },
    );
    
  }

  List<Widget> _createListItems(List<dynamic> data,BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt){
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: Icon(getIconUsingPrefix(name: opt["icon"]),color: Colors.blue,),//va antes del texto en el list
        trailing: Icon(getIconUsingPrefix(name: "keyboard_arrow_right")),
        onTap: (){
          
          Navigator.pushNamed(context, opt["ruta"]);

          /////Asi se hace una navegacion normal a una pagina
          /*
          final route = MaterialPageRoute(
            builder: (context){
              return AlertPage();
            }
          );
          Navigator.push(context, route);
          */
        },

      );
      // push the item to the array of widgets
      opciones..add(widgetTemp)
              ..add(Divider());
    }); 

    return opciones; 
  }
}