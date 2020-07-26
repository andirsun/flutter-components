// Flutter dependencies
import 'package:flutter/material.dart';
// ROutes to all pages in the app
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){
  // returns ROUTE, Widget
  return <String, WidgetBuilder>{
    '/':(context) =>HomePage(),
    'alert':(context) =>AlertPage(),
    'avatar':(context) =>AvatarPage(),
    'card':(context) =>CardPage(),
  };  
}
