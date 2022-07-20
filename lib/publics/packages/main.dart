import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/publics/payment/main.dart';

class Package extends StatefulWidget {
  Package({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PackageState createState() => _PackageState();
}

class _PackageState extends State<Package> {
  var isSelected1 = true;
  var isSelected2 = false;
  var _colors1 = Color(0xFFFCC300);
  var _colors2 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF265229),
          title: Text(
            'PACKAGE',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Semibold',
              fontSize: 14,
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Container(
          margin: EdgeInsets.all(20),
          child: Column(children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      toggleSelection();
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: _colors1, width: 4),
                            borderRadius:
                            BorderRadius.all(const Radius.circular(10))),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "SINGLE PROPERTY",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14, fontFamily: "Semibold"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, bottom: 5, top: 10),
                                    child: Text(
                                      "1 Property ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12, fontFamily: "Semibold"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "For owners &  innkepers",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12, fontFamily: "Regular"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "\$ 10 ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16, fontFamily: "Semibold"),
                                ),
                                Text(
                                  "per month",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12, fontFamily: "Regular"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      toggleSelection();
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: _colors2, width: 4),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(10))),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "MULTI PROPERTY",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14, fontFamily: "Semibold"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, bottom: 5, top: 10),
                                    child: Text(
                                      "2 - 5 Properties",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12, fontFamily: "Semibold"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "For owners &  innkepers",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12, fontFamily: "Regular"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "\$ 50 ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16, fontFamily: "Semibold"),
                                ),
                                Text(
                                  "per month",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12, fontFamily: "Regular"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Payment()));
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(15),
                width: double.infinity,
                decoration: new BoxDecoration(
                  color: Color(0xFFFCC300),
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                child: Text('PAY NOW ',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Semibold',)),
              ),
            )
          ])),
    );
  }

  void toggleSelection() {
    setState(() {
      if (isSelected1 == true) {
        _colors1 = Colors.white;
        isSelected1 = false;
        _colors2 = Color(0xFFFCC300);
        isSelected2 = true;
      } else {
        _colors1 = Color(0xFFFCC300);
        isSelected1 = true;
        _colors2 = Colors.white;
        isSelected2 = false;
      }
    });
  }
}
