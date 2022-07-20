import 'package:flutter/material.dart';

import '../../backend/models/propertyModel.dart';

Widget kOverView(PropertyModel propertyModel) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Overview',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: "Semibold"),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            propertyModel.des ,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontFamily: "Regular",
                  height: 1.5),
              textAlign: TextAlign.left),
        ),

      ],
    ),
  );
}
