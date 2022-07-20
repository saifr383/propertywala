import 'package:flutter/material.dart';

class ListViews extends StatelessWidget {
  ListViews({Key key, @required this.kAgentData, @required this.index})
      : super(key: key);
  final kAgentData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15, left: 15),
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            color: const Color(0xff7c94b6),
            image: new DecorationImage(
              image: new NetworkImage(
                '' + kAgentData[index]['image'],
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
          ),
        ),
        Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 28),
            child: Text(
              '' + kAgentData[index]['name'],
              style: TextStyle(
                  color: Colors.white, fontFamily: "Semibold", fontSize: 12),
            )),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: 15),
          child: Text(
            '' + kAgentData[index]['location'],
            style: TextStyle(
                color: Colors.white70, fontFamily: "Semibold", fontSize: 10),
          ),
        ),
      ],
    );
  }
}
