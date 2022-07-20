import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.black,
      isScrollable: false,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Color(0xFFFCC300),
      labelStyle: TextStyle(
          fontFamily: 'Semibold', fontSize: 12),
      unselectedLabelStyle: TextStyle(
          fontFamily: 'Regular', fontSize: 11),
      tabs: [
        new Tab(
          child: Text(
            'Intro',
          ),
        ),
        new Tab(
          child: Text(
            'Contact',
          ),
        ),
        new Tab(
          child: Text(
            'Message',
          ),
        ),
      ],

    );
  }
}
