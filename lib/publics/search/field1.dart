import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Field1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 30),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Bedrooms',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Regular"),
                    ),
                  ),
                  Row(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                      decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(5))),
                      child: Text(
                        '+',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: "Semibold",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '3',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: "Semibold",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                      decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(5))),
                      child: Text(
                        '-',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: "Semibold",
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Bathrooms',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Regular"),
                    ),
                  ),
                  Row(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                      decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(5))),
                      child: Text(
                        '+',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: "Semibold",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '3',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: "Semibold",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                      decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(5))),
                      child: Text(
                        '-',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: "Semibold",
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ],
        ));
  }
}
