import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FieldMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15,right: 20,bottom: 20,top: 10),
      child: Column(
        children: <Widget>[
          message(
              "https://images.unsplash.com/photo-1489779162738-f81aed9b0a25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
              "Kent",
              "Would like to buy this properties..",
              "1 hr ago"),
          SizedBox(height: 10,),
          message(
              "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
              "ANISLEY",
              "This property 100% furnished?",
              "Yesterday"),
        ],
      ),
    );
  }

  Widget message(String image, String name, String decs, String time) {
    return Row(
      children: <Widget>[
        Container(
          width: 60.0,
          height: 60.0,
          margin: EdgeInsets.all(5),
          decoration: new BoxDecoration(
            color: const Color(0xff7c94b6),
            image: new DecorationImage(
              image: new NetworkImage('' + image),
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
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 5),
                  child: Text(
                    '' + name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "Semibold"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 5),
                  child: Text(
                    '' + decs,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontFamily: "Semibold"),
                  ),
                ),
              ],
            )),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            '' + time,
            style: TextStyle(
                color: Colors.grey, fontSize: 10, fontFamily: "Regular"),
          ),
        )
      ],
    );
  }
}
