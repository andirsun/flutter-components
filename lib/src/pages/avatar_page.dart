import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(7),
            child: CircleAvatar(
              radius: 23,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/barber2.gif'),
          image: NetworkImage('https://www.ezanime.net/wp-content/uploads/2020/06/Robert-Downey-Jr.-950x500.jpg')),
      ),
    );
  }
}