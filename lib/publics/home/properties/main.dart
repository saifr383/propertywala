import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:myyaowrealtorfltheme/publics/home/properties/list.dart';

class RecentProperties extends StatelessWidget {
  RecentProperties({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        color: Colors.white,
        height: 60,
        padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
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
                    size: 18,
                  ),
                  Text(
                    '  RECENT PROPERTIES',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Semibold',
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: new BorderRadius.circular(15.0),
              ),
              child: Text(
                '  SEE ALL  ',
                style: TextStyle(
                    color: Colors.black, fontSize: 8, fontFamily: 'Semibold'),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 250,
        color: Colors.white,
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
