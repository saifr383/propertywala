import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      unselectedLabelColor: Colors.black,
      labelColor: Colors.white,
      isScrollable: false,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(
          fontWeight: FontWeight.bold, fontFamily: 'Regular', fontSize: 10),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold, fontFamily: 'Regular', fontSize: 10),
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Color(0xFF265229)),
      tabs: [
        new Tab(

          child:  Text("Buy"),

        ),

        new Tab(

          child:  Text("Rent"),


        ),
        new Tab(

          child: Text("Projects"),

        ),

      ],
    );
  }
}
