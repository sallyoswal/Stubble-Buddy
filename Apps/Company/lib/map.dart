import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

GoogleMapController controller;
class MapPageState extends State<MapPage> {
  Completer <GoogleMapController> _controller = Completer();


  static final CameraPosition position1 = CameraPosition(
      target: LatLng(0, 0),
      zoom: 0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: position1,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToMyPosition,
        label: Text('My Location'),
        icon: Icon(Icons.my_location),

      ),
    );
  }
  Future<void> _goToMyPosition() async {
    Position p = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    LatLng po = LatLng(p.latitude, p.longitude);
    final GoogleMapController controller = await _controller.future;

    final CameraPosition popo = CameraPosition(
      target: LatLng(po.latitude, po.longitude),
      zoom: 19.0,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(popo));
  }


}

