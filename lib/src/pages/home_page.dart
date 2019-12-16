import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart'; 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body:_lista(),
    );
  }
      
  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder:(context, AsyncSnapshot<List<dynamic>> snapshot){
        
        //print(snapshot.data);

        return ListView(
          children:_listaItems(snapshot.data,context),
        );
      },
    );
    
    //print(menuProvider.opciones);//need to import menu_provider
    
  }

  List<Widget> _listaItems(List<dynamic> data,BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt){
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt["icon"]),//va antes del texto en el list
        trailing: Icon(Icons.keyboard_arrow_right),
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

      opciones..add(widgetTemp)
              ..add(Divider());
    }); 

    return opciones; 
  }
}