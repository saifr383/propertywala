import 'package:flutter/material.dart';

class TilesNotification extends StatefulWidget {
  @override
  _TilesNotificationState createState() => _TilesNotificationState();
}

class _TilesNotificationState extends State<TilesNotification> {
  bool value1 = true;
  bool value2 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
      child: Column(children: <Widget>[
        CheckboxListTile(
          value: value1,
          title: Text(
            'When someone enquired property',
            style: TextStyle(color: Colors.black, fontSize: 12,fontFamily: "Regular"),
          ),
          onChanged: (bool value) {
            setState(() {
              value1 = value;
            });
          },
        ),
        CheckboxListTile(
          value: value2,
          title: Text(
            'When someone contact me',
            style: TextStyle(color: Colors.black, fontSize: 12,fontFamily: "Regular"),
          ),
          onChanged: (bool value) {
            setState(() {
              value2 = value;
            });
          },
        ),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFFCC300),
              borderRadius: BorderRadius.all(
                const Radius.circular(5),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    'SAVE',
                    style: TextStyle(color: Colors.black, fontSize: 12,fontFamily: "Semibold"),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                  size: 20,
                )
              ],
            )),
      ]),
    );
  }
}
