import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:myyaowrealtorfltheme/publics/published/main.dart';

class Payment extends StatefulWidget {
  Payment({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int radioValue = 0;
  bool monVal = false;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  var bank = <String>[
    'IOB',
    'HTFC',
  ];

  int _bank;

  bool debit = false;
  bool credit = false;
  bool net = false;
  bool wallet = false;
  bool upi = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xFF265229),
          statusBarIconBrightness: Brightness.light),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF265229),
          centerTitle: true,
          title: Text(
            'PAYMENT',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          elevation: 0.0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20,bottom: 20,top: 40,right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      border:
                          new Border.all(width: 1.0, color: Colors.grey[400]),
                    ),
                    child: Column(
                      children: <Widget>[
                        ExpansionTile(
                          onExpansionChanged: (_) {
                            setState(() {
                              if (debit == true) {
                                debit = false;
                                credit = false;
                                net = false;
                                wallet = false;
                                upi = false;
                              } else {
                                debit = true;
                                credit = false;
                                net = false;
                                wallet = false;
                                upi = false;
                              }
                            });
                          },
                          initiallyExpanded: debit,
                          title: Text(
                            'Debit Card',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Semibold',
                                fontSize: 12),
                          ),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    'Card Number',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Regular',
                                        fontSize: 12),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Regular'),
                                      decoration: new InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          hintText: 'Enter Card Number',
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Regular',
                                              fontSize: 12)),
                                    ),
                                  ),
                                  Text(
                                    'Cardholder Name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Regular',
                                        fontSize: 12),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Regular'),
                                      decoration: new InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          hintText: 'Enter Name',
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Regular',
                                              fontSize: 12)),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Text(
                                              'Expiry',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Regular',
                                                  fontSize: 12),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, right: 5),
                                              child: TextField(
                                                cursorColor: Colors.black,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Regular',
                                                    fontSize: 12
                                                ),
                                                decoration: new InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 1),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 1),
                                                    ),
                                                    hintText: 'MM-YY',
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily: 'Regular',
                                                        fontSize: 12)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Text(
                                              'CVV',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Regular',
                                                  fontSize: 12),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 5),
                                              child: TextField(
                                                cursorColor: Colors.black,
                                                style:   TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Regular',
                                                  fontSize: 12
                                              ),
                                                decoration: new InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 1),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 1),
                                                    ),
                                                    hintText: 'CVV',
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily: 'Regular',
                                                        fontSize: 12)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 5, right: 5),
                                        child: Icon(
                                          MaterialCommunityIcons.credit_card,
                                          size: 40,
                                        ),
                                      )
                                    ],
                                  ),
                                  CheckboxListTile(
                                    title: Text(
                                      "Save this card",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Semibold',
                                        fontSize: 12
                                      ),
                                    ),
                                    value: monVal,
                                    onChanged: (bool value) {
                                      setState(() {
                                        monVal = value;
                                      });
                                    },
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        ExpansionTile(
                          onExpansionChanged: (_) {
                            setState(() {
                              if (credit == true) {
                                debit = false;
                                credit = false;
                                net = false;
                                wallet = false;
                                upi = false;
                              } else {
                                debit = false;
                                credit = true;
                                net = false;
                                wallet = false;
                                upi = false;
                              }
                            });
                          },
                          initiallyExpanded: net,
                          title: Text(
                            'Credit Card',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Semibold',
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    'Card Number',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Regular',
                                        fontSize: 12),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Regular'),
                                      decoration: new InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          hintText: 'Enter Card Number',
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Regular',
                                              fontSize: 12)),
                                    ),
                                  ),
                                  Text(
                                    'Cardholder Name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Regular',
                                        fontSize: 12),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Regular'),
                                      decoration: new InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          hintText: 'Enter Name',
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Regular',
                                              fontSize: 12)),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Text(
                                              'Expiry',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Regular',
                                                  fontSize: 12),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, right: 5),
                                              child: TextField(
                                                cursorColor: Colors.black,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Regular',fontSize: 12),
                                                decoration: new InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 1),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 1),
                                                    ),
                                                    hintText: 'MM-YY',
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily: 'Regular',
                                                        fontSize: 12)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Text(
                                              'CVV',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Regular',
                                                  fontSize: 12),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 5),
                                              child: TextField(
                                                cursorColor: Colors.black,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Regular',fontSize: 12),
                                                decoration: new InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 1),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 1),
                                                    ),
                                                    hintText: 'CVV',
                                                    hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Regular',fontSize: 10),),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 5, right: 5),
                                        child: Icon(
                                          MaterialCommunityIcons.credit_card,
                                          size: 40,
                                        ),
                                      )
                                    ],
                                  ),
                                  CheckboxListTile(
                                    title: Text(
                                      "Save this card",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Semibold',fontSize: 12),
                                    ),
                                    value: monVal,
                                    onChanged: (bool value) {
                                      setState(() {
                                        monVal = value;
                                      });
                                    },
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        ExpansionTile(
                          onExpansionChanged: (_) {
                            setState(() {
                              if (net == true) {
                                debit = false;
                                credit = false;
                                net = false;
                                wallet = false;
                                upi = false;
                              } else {
                                debit = false;
                                credit = false;
                                net = true;
                                wallet = false;
                                upi = false;
                              }
                            });
                          },
                          initiallyExpanded: net,
                          title: Text(
                            'Net Banking',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Regular',
                                fontSize: 12),
                          ),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          child: Image.network(
                                              'https://image3.mouthshut.com/images/imagesp/925004492s.jpg'),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          child: Image.network(
                                              'https://assets-news-bcdn.dailyhunt.in/cmd/resize/400x400_60/fetchdata13/images/a8/54/37/a85437b65b977a05a9ff50d55f7b37ef.jpg'),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          child: Image.network(
                                              'https://image3.mouthshut.com/images/imagesp/925004501s.png'),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          child: Image.network(
                                              'https://www.livechennai.com/businesslistings/News_photo/Canara-Bank15118.jpg'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
                                      hint: new Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Other Banks',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Regular',fontSize: 12),
                                        ),
                                      ),
                                      value: _bank == null ? null : bank[_bank],
                                      items: bank.map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Regular',fontSize: 12),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _bank = bank.indexOf(value);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        ExpansionTile(
                          onExpansionChanged: (_) {
                            setState(() {
                              if (wallet == true) {
                                debit = false;
                                credit = false;
                                net = false;
                                wallet = false;
                                upi = false;
                              } else {
                                debit = false;
                                credit = false;
                                net = false;
                                wallet = true;
                                upi = false;
                              }
                            });
                          },
                          initiallyExpanded: wallet,
                          title: Text(
                            'Wallet',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Semibold',
                                fontSize: 12),
                          ),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 60,
                                        width: 60,
                                        margin: EdgeInsets.all(5),
                                        child: Image.network(
                                            'https://img.etimg.com/thumb/msid-65556791,width-300,imgsize-61768,resizemode-4/freecharge.jpg'),
                                      ),
                                      Container(
                                        height: 60,
                                        width: 60,
                                        margin: EdgeInsets.all(5),
                                        child: Image.network(
                                            'https://d3pzq99hz695o4.cloudfront.net/sitespecific/in/stores/web/b360f8819f3ef7972bfeba2ba708b8a2/mobikwik-logo-large.jpg?627430'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        ExpansionTile(
                          onExpansionChanged: (_) {
                            setState(() {
                              if (upi == true) {
                                debit = false;
                                credit = false;
                                net = false;
                                wallet = false;
                                upi = false;
                              } else {
                                debit = false;
                                credit = false;
                                net = false;
                                wallet = false;
                                upi = true;
                              }
                            });
                          },
                          initiallyExpanded: wallet,
                          title: Text(
                            'UPI',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Semibold',
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  'Please enter your VPA and TAP on PAY.You need to approve the request on your UPI App to complete the payment',
                                  style: TextStyle(
                                      fontFamily: 'Regular',
                                      color: Colors.black,
                                      fontSize: 12),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Published()));
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(15),
                width: double.infinity,
                decoration: new BoxDecoration(
                  color: Color(0xFFFCC300),
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                child: Text('Pay \$ 50',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Semibold')),
              ),
            )
          ],
        ));
  }

  Future getData() async {
    await new Future.delayed(const Duration(seconds: 5));
    setState(() {
      debit = false;
      credit = false;
      net = false;
      wallet = false;
      upi = false;
    });
  }
}
