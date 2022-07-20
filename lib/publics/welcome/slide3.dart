import 'package:flutter/material.dart';

class Slide3 extends StatelessWidget {
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
              'Sell',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontFamily: 'Semibold',
                  fontWeight: FontWeight.bold),
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
                      image: new AssetImage("assets/images/sell.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              'Sell your property online',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Semibold',
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
