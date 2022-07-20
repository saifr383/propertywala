import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/publics/agent/list.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/main.dart';

class Agent extends StatefulWidget {
  Agent({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AgentState createState() => _AgentState();
}

class _AgentState extends State<Agent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF265229),
          title: Text(
            'AGENT',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Semibold',
              fontSize: 14,
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
      body: Container(
        margin: EdgeInsets.only(right: 15),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/agent.json'),
            builder: (context, snapshot) {
              var kAgentData = json.decode(snapshot.data.toString());
              return GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => AgentDetail()),
                    //   );
                    // },
                    child: ListViews(kAgentData: kAgentData, index: index),
                  );
                },
                itemCount: kAgentData == null ? 0 : kAgentData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.5),
              );
            }),
      ),
    );
  }
}
