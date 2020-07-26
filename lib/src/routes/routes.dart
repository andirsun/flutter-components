// Flutter dependencies
import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/card_page.dart';
import 'package:flutter_components/src/pages/home_page.dart';
// ROutes to all pages in the app



Map<String, WidgetBuilder> getApplicationRoutes(){
  // returns ROUTE, Widget
  return <String, WidgetBuilder>{
    '/':(context) =>HomePage(),
    'alert':(context) =>AlertPage(),
    'avatar':(context) =>AvatarPage(),
    'card':(context) =>CardPage(),
  };  
}
