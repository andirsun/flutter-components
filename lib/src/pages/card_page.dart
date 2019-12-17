import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album,color: Colors.blue,),
            title: Text("Soy el titulo de esta tarjeta"),
            subtitle: Text("Souy ub aslkdaslkdaslkdklasjdsakjdlkasjdalsd  aslkdjkl  alksjdlk  alksdjlk jasd a "),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: (){},
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: (){},
              ),
              
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      child:Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage("https://i.redd.it/1w6s6g3613f31.jpg"),
            placeholder: AssetImage("assets/barber2.gif"),
            fadeInDuration: Duration(milliseconds: 100),
            height: 350,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("nNO se que poner")
          )
        ],
      )
    );
  }
}














