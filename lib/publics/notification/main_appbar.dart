import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/main.dart';
import 'package:myyaowrealtorfltheme/publics/notification/list.dart';

class NotifyAppbar extends StatefulWidget {
  NotifyAppbar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<NotifyAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF265229),
          title: Text(
            'MESSAGE',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Semibold',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: new FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/json/message.json'),
          builder: (context, snapshot) {
            var kAgentData = json.decode(snapshot.data.toString());
            return InkWell(
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => AgentDetail()),
              //   );
              // },
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
