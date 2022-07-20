import 'package:flutter/material.dart';

class About extends StatefulWidget {
  About({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color(0xFF265229),
        centerTitle: true,
        title: Text(
          'ABOUT',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Semibold',
            fontSize: 14,
          ),
        ),
        elevation: 0.0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/homebg.png',
                  height: 220,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 40,
                  ),
                  child: Image.asset(
                    'assets/images/about.png',
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel efficitur tortor. Suspendisse at tristique tellus, a convallis lacus. In rhoncus massa tortor, non consequat risus fermentum eu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular",height: 1.5),
              textAlign: TextAlign.left,

            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Text(
              ' Ut a quam nibh. Donec nisi orci, pretium eget gravida sit amet, tempor scelerisque est. Nunc et nulla ligula. Aenean tempor ullamcorper velit, at egestas lorem consectetur vitae. Vestibulum eget pulvinar lorem',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular",height: 1.5),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
