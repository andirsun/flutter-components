//FLutter dependencies 
import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componenetes'),
      ),
      body:ListView(
        //retorno una lista de items
        children: _crearItems()
      ),
    );
  }


  List<Widget> _crearItems(){ //opcion 2 para una funcion que retorne una lista widgets
    final options = ["One","Two","Three"];//debe ser una propiedad final por que estoy dentro de un StatlesWidget
    //Return a widget for every element in options array
    return options.map((item){
      // wrap with colum to put a divider betwen elements
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
    }).toList();
  }
}