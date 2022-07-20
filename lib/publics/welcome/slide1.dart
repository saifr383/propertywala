
import 'package:flutter/material.dart';

class Slide1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xFF265229),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 70),
            child: Text(
              'Search Property',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,fontFamily: 'Semibold'),
            ),
          ),
          Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  height: 230,
                  width: 230,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/map.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              'Find and select your suitable property',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,fontFamily: 'Regular'),
            ),
          ),
        ],
      ),
    );
  }
}
