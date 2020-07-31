// Flutter dependencies
import 'package:flutter/material.dart';

// Pages
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/animated_container_page.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/card_page.dart';
import 'package:flutter_components/src/pages/home_page.dart';
import 'package:flutter_components/src/pages/input_page.dart';
import 'package:flutter_components/src/pages/mapbox_page.dart';
import 'package:flutter_components/src/pages/movie_detail.dart';
import 'package:flutter_components/src/pages/movies_app.dart';
import 'package:flutter_components/src/pages/qr_page.dart';



Map<String, WidgetBuilder> getApplicationRoutes(){
  // returns ROUTE, Widget
  return <String, WidgetBuilder>{
    '/':(context) =>HomePage(),
    'alert':(context) =>AlertPage(),
    'avatar':(context) =>AvatarPage(),
    'card':(context) =>CardPage(),
    'qr' : (context) =>BarCodeScanner(),
    'input' : (context) =>InputsPage(),
    'animatedContainer' : (context) => AnimatedContainerPage(),
    'mapbox' : (context) => MapBoxPage(),
    'moviesApp' : (context) => MoviesPage(),
    'movieDetail' : (context) => MovieDetail(),
  };  
}
