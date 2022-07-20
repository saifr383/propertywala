import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

Widget kAmenities() {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      Container(
        width: 80.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              MaterialCommunityIcons.wifi,
              color: Colors.grey,
              size: 25,
            ),
            Text(
              'Wi-Fi',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular"),
            )
          ],
        ),
      ),
      Container(
        width: 80.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              MaterialCommunityIcons.car,
              color: Colors.grey,
              size: 25,
            ),
            Text(
              'Car Parking',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular"),
            )
          ],
        ),
      ),
      Container(
        width: 80.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              MaterialCommunityIcons.television,
              color: Colors.grey,
              size: 25,
            ),
            Text(
              'TV',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular"),
            )
          ],
        ),
      ),
      Container(
        width: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              MaterialCommunityIcons.air_conditioner,
              color: Colors.grey,
              size: 25,
            ),
            Text(
              'Air Conditioner',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular"),
            )
          ],
        ),
      ),
      Container(
        width: 120.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              MaterialCommunityIcons.microwave,
              color: Colors.grey,
              size: 25,
            ),
            Text(
              'Microwave Oven',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular"),
            )
          ],
        ),
      ),
      Container(
        width: 120.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              MaterialCommunityIcons.swim,
              color: Colors.grey,
              size: 25,
            ),
            Text(
              'Swimming Pool',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular"),
            )
          ],
        ),
      ),
      Container(
        width: 80.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              MaterialCommunityIcons.laptop,
              color: Colors.grey,
              size: 25,
            ),
            Text(
              'Computer',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular"),
            )
          ],
        ),
      ),
      Container(
        width: 80.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              MaterialCommunityIcons.flower_tulip,
              color: Colors.grey,
              size: 25,
            ),
            Text(
              'Garden',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular"),
            )
          ],
        ),
      ),
    ],
  );
}
