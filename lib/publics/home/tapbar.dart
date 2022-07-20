
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(5.0),
        border: new Border.all(
          width: 1.0,
          color: Colors.white,
        ),
      ),
      child: TabBar(
        unselectedLabelColor: Colors.white,
        labelColor: Colors.black,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.white,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold, fontFamily: 'Regular', fontSize: 9),
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal, fontFamily: 'Regular', fontSize: 8),
        indicator: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
        tabs: [
          new Tab(
            child: Text(
              '      BUY      ',
            ),
          ),
          new Tab(
            child: Text(
              '      RENT      ',
            ),
          ),
          new Tab(
            child: Text(
              '    PROJECTS    ',
            ),
          ),
        ],
      ),
    );
  }
}
