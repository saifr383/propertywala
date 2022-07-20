import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/main.dart';

import '../../backend/models/propertyModel.dart';
import '../add_property/main.dart';

class ListViews extends StatelessWidget {
  ListViews({Key key, this.propertyModel, this.id}) : super(key: key);
  PropertyModel propertyModel;
  String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Get.to(()=>PropertyDetail(propertyModel: propertyModel));},
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: new BorderRadius.only(
                  topRight: const Radius.circular(5),
                  topLeft: const Radius.circular(5)),
              child: Image.network(
                '' + propertyModel.images[0],
                height: 150.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              '' + propertyModel.price,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Semibold',
                                  fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 2, left: 10, bottom: 10),
                            child: Text(
                              '' + propertyModel.address,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: 'Regular'),
                            ),
                          ),
                        ]),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            MaterialCommunityIcons.bed_empty,
                            color: Colors.grey[500],
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              '' + (propertyModel.bedroom+1).toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Semibold'),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Icon(
                            MaterialCommunityIcons.bed_empty,
                            color: Colors.grey[500],
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              '' + (propertyModel.bathroom+1).toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Semibold'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey[100])),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.delete_forever,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  Text(
                                    ' DELETE',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Semibold'),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                _showDialog(context);
                              }),
                        ],
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 80,
                    child: Image.asset(
                      propertyModel.status == 'pending'
                          ? 'assets/images/pending.png'
                          : propertyModel.status == 'accept'
                              ? 'assets/images/accepted.png'
                              : 'assets/images/rejected.png',
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
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
                FirebaseFirestore.instance
                    .collection('Area')
                    .doc(id.toString())
                    .delete();
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
}
