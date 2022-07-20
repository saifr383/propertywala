import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel efficitur tortor. Suspendisse at tristique tellus, a convallis lacus. In rhoncus massa tortor, non consequat risus fermentum eu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontFamily: "Regular",
                height: 1.5),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel efficitur tortor. Suspendisse at tristique tellus, a convallis lacus. In rhoncus massa tortor, non consequat risus fermentum eu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontFamily: "Regular",
                height: 1.5),
            textAlign: TextAlign.left,
          ),
        ],
      )
    );
  }
}
