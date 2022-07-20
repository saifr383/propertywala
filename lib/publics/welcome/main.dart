import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/publics/welcome/bottom.dart';
import 'package:myyaowrealtorfltheme/publics/welcome/slide1.dart';
import 'package:myyaowrealtorfltheme/publics/welcome/slide2.dart';
import 'package:myyaowrealtorfltheme/publics/welcome/slide3.dart';

class Welcome extends StatefulWidget {
  @override
  State createState() => new WelcomeState();
}

class WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  TabController _controller;
  String kbtnext = "Next";
  String kbtskip = "Skip";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF265229),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new TabBarView(
              children: <Widget>[
                Slide1(),
                Slide2(),
                Slide3(),
              ],
              controller: _controller,
            ),
          ),
          Buttom(kbtnext: kbtnext, kbtskip: kbtskip, controller: _controller),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
    _controller.addListener(() {
      check();
    });
  }

  void check() {
    if (_controller.index == 2) {
      setState(() {
        kbtnext = "Done";
        kbtskip = "";
      });
    } else {
      setState(() {
        kbtnext = "Next";
        kbtskip = "Skip";
      });
    }
  }
}
