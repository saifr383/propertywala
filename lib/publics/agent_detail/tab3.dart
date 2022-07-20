import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(5),
                        decoration: new BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(5))),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Regular',
                          ),
                          cursorColor: Colors.black,
                          decoration: new InputDecoration.collapsed(
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: 'Regular',
                            ),
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(5),
                      decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(5))),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: 'Regular',
                        ),
                        cursorColor: Colors.black,
                        decoration: new InputDecoration.collapsed(
                          hintText: 'Last Name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Regular',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(5),
                decoration: new BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: new BorderRadius.all(new Radius.circular(5))),
                child: TextField(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Regular',
                  ),
                  cursorColor: Colors.black,
                  decoration: new InputDecoration.collapsed(
                    hintText: 'Your Email Address',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'Regular',
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(5),
                decoration: new BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: new BorderRadius.all(new Radius.circular(5))),
                child: TextField(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Regular',
                  ),
                  cursorColor: Colors.black,
                  decoration: new InputDecoration.collapsed(
                    hintText: 'Your Mobile No',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'Regular',
                    ),
                  ),
                ),
              ),
              Container(
                height: 150,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(5),
                decoration: new BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: new BorderRadius.all(new Radius.circular(5))),
                child: TextField(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Regular',
                  ),
                  cursorColor: Colors.black,
                  decoration: new InputDecoration.collapsed(
                    hintText: 'Your Message',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'Regular',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0.0),
                      textStyle: MaterialStateProperty.all(
                          TextStyle(color: Colors.black)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFFCC300)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0)),
                      )),
                  onPressed: () {
                    showGeneralDialog(
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionBuilder: (context, a1, a2, widget) {
                          return kDialog(context);
                        },
                        transitionDuration: Duration(milliseconds: 200),
                        // DURATION FOR ANIMATION
                        barrierDismissible: true,
                        barrierLabel: 'LABEL',
                        context: context,
                        pageBuilder: (context, animation1, animation2) {
                          return Text('PAGE BUILDER');
                        });
                  },
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          'SEND',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Semibold',
                          ),
                        ),
                      ),
                      Icon(
                        Icons.mail,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget kDialog(BuildContext context) {
  return Material(
      type: MaterialType.transparency,
      child: Center(
          child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: new BorderRadius.circular(5.0)),
        margin: EdgeInsets.all(20),
        height: 280,
        width: MediaQuery.of(context).size.width / 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/tick.png',
              height: 80,
              width: 80,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'SENT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Semibold',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Your mail has been sent',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Regular',
                  fontSize: 12,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context, false);
              },
              child: Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Color(0xFFFCC300),
                    borderRadius: new BorderRadius.circular(5.0)),
                child: Text(
                  'OKAY',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontFamily: "Regular"),
                ),
              ),
            )
          ],
        ),
      )));
}
