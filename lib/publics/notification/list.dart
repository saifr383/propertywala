import 'package:flutter/material.dart';

class ListViews extends StatelessWidget {
  ListViews({Key key, @required this.kAgentData, @required this.index})
      : super(key: key);
  final kAgentData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        new Container(
          width: 70.0,
          height: 70.0,
          margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
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
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '' + kAgentData[index]['name'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: "Semibold"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    '' + kAgentData[index]['location'],
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontFamily: "Regular"),
                  ),
                )
              ],
            )),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            '' + kAgentData[index]['time'],
            style: TextStyle(
              color: Colors.grey[500],
              fontFamily: "Regular",
              fontSize: 10,
            ),
          ),
        )
      ],
    );
  }
}
