import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';


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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createMap(),
      floatingActionButton: createFloatingButtons(),
    );
  }

  Column createFloatingButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        //Zoom In
        FloatingActionButton(
          child: Icon(Icons.close),
          onPressed: (){
            //mapController.animateCamera(CameraUpdate.tiltTo(60));
            Navigator.pop(context);

          },
        ),
        //Zoom In
        FloatingActionButton(
          child: Icon(Icons.zoom_in),
          onPressed: (){
            //mapController.animateCamera(CameraUpdate.tiltTo(60));
            mapController.animateCamera(CameraUpdate.zoomIn());

          },
        ),
        //Zoom Out
        FloatingActionButton(
          child: Icon(Icons.zoom_out),
          onPressed: (){
            mapController.animateCamera(CameraUpdate.zoomOut());
          },
        ),
        FloatingActionButton(
          child: Icon(Icons.settings_brightness),
          onPressed: (){

            if(selectedStyle == darkStyle){
              selectedStyle = lightStyle;
            }else{
              selectedStyle = darkStyle;
            }
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