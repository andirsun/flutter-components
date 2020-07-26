import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor:  Colors.white,
          shape: StadiumBorder(),
          onPressed:()=> _showAlert(context),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.keyboard_return),
      //   onPressed: (){
      //     //Return Page to the last
      //     Navigator.pop(context);
      //   },
      // ),
    );
  }

  void _showAlert(context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          title: Text("Titulo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Este es el contenido de la alerta que deseamos mostrar"),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: ()=>Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("Accept"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      } 
    );
  }
}