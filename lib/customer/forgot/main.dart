import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  @override
  ForgotState createState() => ForgotState();
}

class ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/bg.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                'FORGOT PASSWORD',
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: "Semibold"),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
            ),
            body: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                      width: 120,
                    )),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      const Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: "Regular"),
                          decoration: InputDecoration(
                            hintText: 'Email Address or Mobile No',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: "Regular"),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, false);
                        },
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color(0xFFFCC300),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: const Radius.circular(10),
                                  bottomRight: const Radius.circular(10)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'SENT',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "Semibold"),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.black,
                                  size: 20,
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
