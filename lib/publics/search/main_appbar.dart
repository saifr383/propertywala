import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myyaowrealtorfltheme/publics/property/main.dart';
import 'package:myyaowrealtorfltheme/publics/search/field1.dart';
import 'package:myyaowrealtorfltheme/publics/search/filed2.dart';
import 'package:myyaowrealtorfltheme/publics/search/searchfield.dart';
import 'package:myyaowrealtorfltheme/publics/search/tabbar.dart';

class SearchAppbar extends StatefulWidget {
  SearchAppbar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchAppbar> {
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
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              brightness: Brightness.dark,
              backgroundColor: Color(0xFF265229),
              centerTitle: true,
              title: Text(
                'SEARCH',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Semibold',
                  fontSize: 14,
                ),
              ),
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () => Navigator.pop(context, false),
              )),
          body: ListView(
            shrinkWrap: false,
            children: <Widget>[
              //Tapbar
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                width: double.infinity,
                height: 40,
                margin: EdgeInsets.all(20),
                child: Tabbar(),
              ),
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
                    padding: MaterialStateProperty.all(
                      EdgeInsets.all(15.0),
                    ),
                    textStyle: MaterialStateProperty.all(
                        TextStyle(color: Colors.black)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFFCC300)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  onPressed: () {

                    ///TODO SEARCH WHAT??

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
      ),
    );
  }
}
