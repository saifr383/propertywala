import 'package:flutter/material.dart';

Widget kImageHead(BuildContext context) {
  return Column(
    children: <Widget>[
      Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/home.jpg',
            width: double.infinity,
            height: 300.0,
            fit: BoxFit.cover,
          ),
          IconButton(
            alignment: Alignment.topLeft,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      )
    ],
  );
}
