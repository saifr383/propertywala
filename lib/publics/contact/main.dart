import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class Contact extends StatefulWidget {
  Contact({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController messagecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color(0xFF265229),
        centerTitle: true,
        title: Text(
          'CONTACT',
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
                    'assets/images/contact.png',
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Message',
                  style: TextStyle(
                      color: Colors.black, fontSize: 12, fontFamily: "Regular"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 30),
                  padding:
                  EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 10),
                  height: 200,
                  decoration: new BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: new BorderRadius.all(new Radius.circular(5))),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty || value == "")
                        return "Field is empty";
                      return null;
                    },
                    controller:messagecontroller,
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Regular', fontSize: 12),
                    cursorColor: Colors.black,
                    decoration: new InputDecoration.collapsed(
                        hintText: 'Send message to app owner',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: "Regular",
                            color: Colors.grey)),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final Email email = Email(
                      body: messagecontroller.text,
                      subject: 'App Message',
                      recipients: ['contact@propertywaly.co'],

                    );
                    await FlutterEmailSender.send(email);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xFFFCC300),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(5))),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Send',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "Semibold"),
                          ),
                          Icon(
                            Icons.send,
                            size: 25,
                            color: Colors.black,
                          )
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
