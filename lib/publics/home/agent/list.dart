import 'package:flutter/material.dart';

class ListViews extends StatelessWidget {
  ListViews({Key key, @required this.kAgentData, @required this.index})
      : super(key: key);
  final kAgentData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          width: 70.0,
          height: 70.0,
          margin: EdgeInsets.all(10),
          decoration: new BoxDecoration(
            color: const Color(0xff7c94b6),
            image: new DecorationImage(
              image: new NetworkImage(
                '' + kAgentData[index]['image'],
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Text(
            '' + kAgentData[index]['name'],
            style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                fontFamily: 'Regular'),
          ),
        ),
      ],
    );
  }
}
