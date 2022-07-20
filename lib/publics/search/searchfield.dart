import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20,right: 20,left: 10,bottom: 20),
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: new BoxDecoration(
          color: Colors.grey[200],
          borderRadius: new BorderRadius.all(new Radius.circular(5))),
      child: Row(
        children: <Widget>[
          new Flexible(
            child: TextField(
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Regular', fontSize: 12),
              cursorColor: Colors.black,
              decoration: new InputDecoration.collapsed(
                  hintText: 'e.g.Brixton, NW3 or NW3 5TV',
                  hintStyle: TextStyle(fontSize: 12,fontFamily: 'Regular')),
            ),
          ),

        ],
      ),
    );
  }
}
