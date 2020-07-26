// FLutter dependencies
import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/routes/routes.dart';


 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: true,
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