import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'package:mapbox_gl/mapbox_gl.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';


class MapBoxPage extends StatefulWidget {
  MapBoxPage({Key key}) : super(key: key);

  @override
  _MapBoxPageState createState() => _MapBoxPageState();
}

class _MapBoxPageState extends State<MapBoxPage> {
  
  //Instance of map controller
  MapboxMapController mapController;
  // Default Map Coords
  final center = LatLng(37.809441, -122.476520);
  //Default Map Style (create more on mapbox studio)
  String selectedStyle = 'mapbox://styles/andirsun/ckd4ky51y14u91jo61hqcy4ek';
  // Other Available Styles
  final darkStyle = 'mapbox://styles/andirsun/ckd4krpld0kp81inwteb2chug';
  final lightStyle = 'mapbox://styles/andirsun/ckd4ky51y14u91jo61hqcy4ek';
   
  /*
    Creates an instance of mapbox and draw the widget
  */
  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    _onStyleLoaded();
  }

  void _onStyleLoaded() {
    addImageFromAsset("myMark", "assets/custom-icon.png");
    addImageFromUrl("networkImage", "https://via.placeholder.com/50");
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  /// Adds a network image to the currently displayed style
  Future<void> addImageFromUrl(String name, String url) async {
    var response = await http.get(url);
    return mapController.addImage(name, response.bodyBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hola"),
      ),
      body: createMap(),
      floatingActionButton: createFloatingButtons(),
    );
  }

  Column createFloatingButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Set a mark
        FloatingActionButton(
          heroTag: null,
          child: Icon(Icons.sentiment_neutral),
          onPressed: (){
            mapController.addSymbol(SymbolOptions(
              geometry: center,
              iconSize: 2,
              textField: 'Arbol creado aqui',
              iconImage: 'park-15',
              textOffset: Offset(0, 2)
            ));
          },
        ),
        SizedBox(height: 5),
        //Zoom In
        FloatingActionButton(
          heroTag: null,
          child: Icon(Icons.zoom_in),
          onPressed: (){
            //mapController.animateCamera(CameraUpdate.tiltTo(60));
            mapController.animateCamera(CameraUpdate.zoomIn());
          },
        ),
        SizedBox(height: 5),
        //Zoom Out
        FloatingActionButton(
          heroTag: null,
          child: Icon(Icons.zoom_out),
          onPressed: (){
            mapController.animateCamera(CameraUpdate.zoomOut());
          },
        ),
        SizedBox(height: 5),
        FloatingActionButton(
          heroTag: null,
          child: Icon(Icons.settings_brightness),
          onPressed: (){

            if(selectedStyle == darkStyle){
              selectedStyle = lightStyle;
            }else{
              selectedStyle = darkStyle;
            }
            // Persistent in icons
            _onStyleLoaded();
            setState(() {});
          }
        )
      ],
    );
  }

  MapboxMap createMap() {
    return MapboxMap(
      onMapCreated: _onMapCreated,
      styleString: selectedStyle,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 14,
      ),
    );
  }
}