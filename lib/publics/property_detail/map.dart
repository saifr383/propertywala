import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Widget kMaps(
    CameraPosition _kGooglePlex, GoogleMapController _controller,Location address) {



  return Container(
    color: Colors.grey[300],
    padding: EdgeInsets.only(top: 30),
    child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15, top: 5, bottom: 15),
          child: Text(
            'Location',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontFamily: "Semibold"),
          ),
        ),
        Container(
          height: 220,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              print("TEST LOADED");
              _controller=controller;
              _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(address.latitude, address.longitude), zoom: 15)));
            },
          ),
        )
      ],
    ),
  );
}
