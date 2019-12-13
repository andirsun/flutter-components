import 'package:flutter/material.dart';
class HomePageTemp extends StatelessWidget {
  final opciones = ["Uno","Dos","Tres"];//debe ser una propiedad final por que estoy dentro de un StatlesWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componenetes Temp'),
      ),
      body:ListView(
        children: _crearItems()//retorno una lista de items 
      ),
    );
  }


  List<Widget> _crearItems(){ //opcion 2 para una funcion que retorne una lista widgets
    return opciones.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text("Subtitulo"),
            leading: Icon( Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();//lo vuelvo lista para poder retornarlo y no me de error
  }
  /*
  List<Widget> _crearItems(){ //opcin 1 

    List<Widget> lista = new List<Widget>();
    for (String opt in opciones){
      final tempWidget = ListTile(
        title : Text(opt) 
      );

      lista..add(tempWidget) //meto cada widget del listview en la lista 
            ..add(Divider()); //meto el divider
      
    }
    return lista;
  }*/
}