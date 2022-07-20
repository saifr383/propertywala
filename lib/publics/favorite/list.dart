import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/main.dart';

import '../../backend/models/propertyModel.dart';

class ListViews extends StatelessWidget {
  ListViews({Key key, @required this.kFeatureData})
      : super(key: key);
  final kFeatureData;
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: FutureBuilder(
        future:FirebaseFirestore.instance.collection('Area').doc(kFeatureData['post']).get(),
        builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.hasData){
            var data=PropertyModel.fromMap(snapshot.data.data(),snapshot.data.id);
            return InkWell(
              onTap: (){Get.to(()=>PropertyDetail(propertyModel: data));},
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: new BorderRadius.all(const Radius.circular(5)),
                    child: Image.network(
                      '' + data.images[0],
                      width: 180.0,
                      height: 90.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10, bottom: 5),
                            child: Text(
                              '' + data.price,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Regular"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, bottom: 5),
                            child: Text(
                              '' + data.address,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontFamily: "Regular"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MaterialCommunityIcons.bed_empty,
                                        color: Colors.grey[500],
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          '' + (data.bedroom+1).toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Semibold'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MaterialCommunityIcons.bed_empty,
                                        color: Colors.grey[500],
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          '' + (data.bathroom+1).toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Semibold'),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  // InkWell(
                  //     onTap: () {
                  //       _showDialog(context);
                  //     },
                  //     child: Container(
                  //       padding: EdgeInsets.all(10),
                  //       child: Icon(
                  //         MaterialCommunityIcons.delete_forever_outline,
                  //         color: Colors.grey[500],
                  //         size: 25,
                  //       ),
                  //     ))
                ],
              ),
            );
          }
          return Container();
        }
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text(
          "REMOVE",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: "Semibold"),
        ),
        content: new Text(
          "Are you sure you want to remove?",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: "Regular"),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new TextButton(
            child: new Text(
              "Yes",
              style: TextStyle(
                  color: Colors.red, fontSize: 14, fontFamily: "Regular"),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          new TextButton(
            child: new Text(
              "Cancel",
              style: TextStyle(
                  color: Colors.green, fontSize: 14, fontFamily: "Regular"),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
