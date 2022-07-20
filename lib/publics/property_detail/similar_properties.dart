import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:myyaowrealtorfltheme/publics/home/properties/list.dart';
import 'package:myyaowrealtorfltheme/publics/property/main.dart';

class SimilarProperties extends StatelessWidget {
  SimilarProperties({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        color: Colors.grey[200],
        height: 80,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Icon(
                    MaterialCommunityIcons.location_enter,
                    color: Colors.black,
                    size: 20,
                  ),
                  Text(
                    '  SIMILAR PROPERTIES',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Semibold"),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {

                ///TODO ????

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Property()),
                // );
              },
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                child: Text(
                  'SEE ALL',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Semibold'),
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        height: 250,
        color: Colors.grey[200],
        padding: EdgeInsets.only(bottom: 30),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/feature.json'),
            builder: (context, snapshot) {
              var kFeatureData = json.decode(snapshot.data.toString());
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return ListViews(kFeatureData: kFeatureData, index: index);
                },
                itemCount: kFeatureData == null ? 0 : kFeatureData.length,
              );
            }),
      ),
    ]);
  }
}
