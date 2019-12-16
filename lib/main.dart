import 'package:componentes/src/pages/home_page.dart';
import 'package:flutter/material.dart';


import 'package:componentes/src/pages/home-temp.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      home:  HomePage() //cambgie el home de la app importando otra pagina 
    );
  }
}