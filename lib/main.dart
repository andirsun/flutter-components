import 'package:flutter/material.dart';


import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/home-temp.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //home:  HomePage() //cambgie el home de la app importando otra pagina 
      initialRoute: '/',
      routes:getApplicationRoutes(),
      onGenerateRoute: (settings){ //cuando una ruta no esta definida entonces entra a ONgenerateROute y se hace alguna logica
        print('Ruta llamada '+settings.name);
        return MaterialPageRoute(
          builder: (BuildContext context)=>AlertPage()
        );
      },
    );
  }
}