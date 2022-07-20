import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/user_controller.dart';
import 'package:myyaowrealtorfltheme/publics/favorite/list.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/main.dart';

class Favorite extends StatefulWidget {
  Favorite({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  UserController _controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10),
            child: ListViews(kFeatureData: _controller.userModel.likes[index]),
          );
        },
        itemCount:_controller.userModel.likes==null?[]:_controller.userModel.likes.length,
      )
    );
  }
}
