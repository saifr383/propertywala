import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:myyaowrealtorfltheme/publics/home/agent/list.dart';

class Agents extends StatelessWidget {
  Agents({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        color: Colors.grey[200],
        height: 60,
        padding: EdgeInsets.only(top: 20, left: 10, bottom: 10, right: 10),
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
                    '  MEET OUR AGENTS',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'Semibold'),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[300],
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
        height: 130,
        color: Colors.grey[200],
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/agent.json'),
            builder: (context, snapshot) {
              var kAgentData = json.decode(snapshot.data.toString());
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return ListViews(kAgentData: kAgentData, index: index);
                },
                itemCount: kAgentData == null ? 0 : kAgentData.length,
              );
            }),
      ),
    ]);
  }
}
