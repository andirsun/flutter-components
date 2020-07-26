import 'package:flutter/material.dart';

//this files let load dynamic icon, when i give the string of icon
final _icons = <String,IconData>{
  'add_alert' :Icons.add_alert,
  'accessibility': Icons.accessibility_new,
  'folder_open': Icons.folder_open
};

Icon getIcon(String nombreIcono){
  return Icon( _icons[nombreIcono],color:Colors.blue);
}