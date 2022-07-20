import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/publics/settings/tiels_password.dart';
import 'package:myyaowrealtorfltheme/publics/settings/tiles_notify.dart';

class Settings extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  bool checkBoxValue = false;
  List<IconData> _icon = [
    Icons.add,
    Icons.remove,
  ];
  bool password = false;
  bool notification = false;
  int _password = 0;
  int knotification = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        kHeader(context),
        InkWell(
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 1),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(
                const Radius.circular(5),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "Semibold"),
                  ),
                ),
                Icon(
                  _icon[_password],
                  color: Colors.black,
                  size: 15,
                )
              ],
            ),
          ),
          onTap: () {


            setState(() {
              if (password == true) {
                _password = 0;
                knotification = 0;

                password = false;
                notification = false;
              } else {
                _password = 1;
                knotification = 0;

                password = true;
                notification = false;
              }
            });
          },
        ),
        Visibility(
          child: TilesPassword(),
          visible: password,
        ),
       
      ]),
    );
  }
}

Widget kHeader(BuildContext context) {
  return Container(
    color: Color(0xFF265229),
    height: 220,
    width: double.infinity,
    child: Column(children: <Widget>[
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () => Navigator.of(context)
            .pop()
            ,
        ),
      ),
      Image.asset(
        'assets/images/setting.png',
        height: 100,
        width: 100,
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Text(
          'Settings',
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Regular"),
        ),
      )
    ]),
  );
}
