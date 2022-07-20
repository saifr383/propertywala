import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/publics/notification/list.dart';

class Notify extends StatefulWidget {
  Notify({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/json/message.json'),
          builder: (context, snapshot) {
            var kAgentData = json.decode(snapshot.data.toString());
            return InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AgentDetail()),
                // );
              },
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return ListViews(kAgentData: kAgentData, index: index);
                },
                itemCount: kAgentData == null ? 0 : kAgentData.length,
              ),
            );
          }),
    );
  }
}
