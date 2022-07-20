import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myyaowrealtorfltheme/customer/signin/main.dart';
import 'package:myyaowrealtorfltheme/publics/main/main.dart';

class Buttom extends StatelessWidget {
  Buttom(
      {Key key,
      @required this.controller,
      @required this.kbtnext,
      @required this.kbtskip})
      : super(key: key);
  final TabController controller;
  final String kbtnext;
  final String kbtskip;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF265229),
      child: Row(children: <Widget>[
        new TextButton(
            child: new Row(
              children: <Widget>[
                //new Icon(Icons.chevron_left),
                new Text(
                  kbtskip,
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontFamily: 'Regular'),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignIn()));
            }),
        new Expanded(
          child: new Center(
            child: new TabPageSelector(
              controller: controller,
              selectedColor: Colors.white,
              color: Color(0xFF265229),
              indicatorSize: 10,
            ),
          ),
        ),
        new TextButton(
          child: new Row(
            children: <Widget>[
              new Text(
                kbtnext,
                style: TextStyle(
                    color: Colors.white, fontSize: 12, fontFamily: 'Regular'),
              ),
              //   new Icon(Icons.chevron_right),
            ],
          ),
          onPressed: () async {
            if (controller.index < controller.length - 1) {
              controller.animateTo(controller.index + 1);
            } else {
              try {


                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignIn()));

              } on SocketException catch (_) {
                Fluttertoast.showToast(
                    msg:
                        "Internet not connected! Please connect your internet!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 12.0);
              }
            }
          },
        ),
      ]),
    );
  }
}
