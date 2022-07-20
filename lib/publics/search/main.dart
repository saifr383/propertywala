import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myyaowrealtorfltheme/publics/property/main.dart';
import 'package:myyaowrealtorfltheme/publics/search/field1.dart';
import 'package:myyaowrealtorfltheme/publics/search/filed2.dart';
import 'package:myyaowrealtorfltheme/publics/search/searchfield.dart';

class Search extends StatefulWidget {
  Search({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List data;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xFF265229),
          statusBarIconBrightness: Brightness.dark),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          shrinkWrap: false,
          children: <Widget>[
            //Tapbar
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, bottom: 8),
              child: Text(
                'Location',
                style: TextStyle(
                    color: Colors.black, fontSize: 12, fontFamily: "Regular"),
              ),
            ),
            //SearchField
            SearchField(),
            //Fields
            Field1(),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, bottom: 5, top: 15),
              child: Text(
                'Price',
                style: TextStyle(
                    color: Colors.black, fontSize: 12, fontFamily: "Regular"),
              ),
            ),
            //Fields
            Field2(),
            //Button
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.0),
                    textStyle: MaterialStateProperty.all(
                        TextStyle(color: Colors.black)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFFCC300))),
                onPressed: () {

                  ///SEARCH WHAT??

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Property()),
                  // );
                },
                child: new Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'SEARCH',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: "Semibold"),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 18,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
