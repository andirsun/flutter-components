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
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album,color: Colors.blue,),
            title: Text("Soy el titulo de esta tarjeta"),
            subtitle: Text("Lorem impsun valor etae estimactedm for the sale impuns "),
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
    final card = Container(
      child:Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage("https://i.redd.it/1w6s6g3613f31.jpg"),
            placeholder: AssetImage("assets/barber2.gif"),
            //fadeInDuration: Duration(milliseconds: 100),
            height: 370,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Algun subtitulo cualquiera")
          )
        ],
      )
    );

    return Container(
      // Clip RRect is for make any widget with rounded corners
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        // emulate a card shadow
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0,10.0)
          )
        ]
      ),
      
    );
  }
}














