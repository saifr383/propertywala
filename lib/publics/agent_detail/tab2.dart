import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:myyaowrealtorfltheme/backend/models/user.dart';

class Tab2 extends StatelessWidget {
  UserModel userModel;
  Tab2(this.userModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Container(
        //   padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
        //   child: Row(
        //     children: <Widget>[
        //       Container(
        //         padding: EdgeInsets.all(10),
        //         child: Icon(Icons.location_on),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.stretch,
        //           children: <Widget>[
        //             Container(
        //               padding: EdgeInsets.only(bottom: 5),
        //               child: Text(
        //                 'ADDRESS',
        //                 style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 12,
        //                   fontFamily: 'Regular',
        //                 ),
        //               ),
        //             ),
        //             Text(
        //               '3-277-10 Susan Apartment,',
        //               style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 12,
        //                 fontFamily: 'Regular',
        //               ),
        //             ),
        //             Text(
        //               'Liverpool, United Kingdom',
        //               style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 12,
        //                 fontFamily: 'Regular',
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Container(
          padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.phone),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'PHONE',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Regular',
                        ),
                      ),
                    ),
                    Text(
                      userModel.phoneNo,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Regular',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
          child: Row(children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.email),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'EMAIL',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Regular',
                      ),
                    ),
                  ),
                  Text(
                    userModel.email,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Regular',
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        // Container(
        //   padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
        //   child: Row(children: <Widget>[
        //     Container(
        //       padding: EdgeInsets.all(10),
        //       child: Icon(MaterialCommunityIcons.web),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.stretch,
        //         children: <Widget>[
        //           Container(
        //             padding: EdgeInsets.only(bottom: 5),
        //             child: Text(
        //               'WEBSITE',
        //               style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 12,
        //                 fontFamily: 'Regular',
        //               ),
        //             ),
        //           ),
        //           Text(
        //             'www.myyaowrealtor.com',
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 12,
        //               fontFamily: 'Regular',
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ]),
        // ),
      ],
    );
  }
}
