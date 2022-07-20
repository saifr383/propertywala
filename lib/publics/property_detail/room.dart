import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../backend/models/propertyModel.dart';

Widget kRooms(PropertyModel propertyModel) {
  return Container(
      padding: EdgeInsets.all(15),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey[300], width: 1)),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              propertyModel.propertySubType!='Plot'?
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MaterialCommunityIcons.bed_empty,
                      color: Color(0xFFFCC300),
                      size: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            (propertyModel.bedroom+1).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Semibold",
                                fontSize: 14),
                          ),
                          Text(
                            ' Beds',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontFamily: "Regular",
                                fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ):SizedBox(),
              propertyModel.propertySubType!='Plot'?
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MaterialCommunityIcons.bed_empty,
                      color: Color(0xFFFCC300),
                      size: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            (propertyModel.bathroom+1).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Semibold",
                                fontSize: 14),
                          ),
                          Text(
                            ' Baths',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontFamily: "Regular",
                                fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ):SizedBox(),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MaterialCommunityIcons.bed_empty,
                      color: Color(0xFFFCC300),
                      size: 30,
                    ),
                    int.parse(propertyModel.area)>=20?Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            (int.parse(propertyModel.area)/20.0).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Semibold",
                                fontSize: 14),
                          ),
                          Text(
                            ' Kanal',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontFamily: "Regular",
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ):
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            propertyModel.area,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Semibold",
                                fontSize: 14),
                          ),
                          Text(
                            ' Marla',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontFamily: "Regular",
                                fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ));
}
