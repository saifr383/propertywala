import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/publics/favorite/list.dart';
import 'package:myyaowrealtorfltheme/publics/favorite/main.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/main.dart';

class FavoriteAppbar extends StatefulWidget {
  FavoriteAppbar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<FavoriteAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF265229),
        title: Text(
          'FAVORITE',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Semibold',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Favorite(),
    );
  }
}
