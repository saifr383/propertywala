import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:myyaowrealtorfltheme/publics/Profile/main.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/main.dart';
import 'package:myyaowrealtorfltheme/publics/dashboard/message_filed.dart';
import 'package:myyaowrealtorfltheme/publics/dashboard/name_filed.dart';
import 'package:myyaowrealtorfltheme/publics/favorite/main_appbar.dart';
import 'package:myyaowrealtorfltheme/publics/notification/main_appbar.dart';
import 'package:myyaowrealtorfltheme/publics/packages/main.dart';
import 'package:myyaowrealtorfltheme/publics/property_edit/main.dart';
import 'package:myyaowrealtorfltheme/publics/settings/main.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List data;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xFF265229),
          statusBarIconBrightness: Brightness.dark),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          //Name Field
          FieldName(),
          //  Field Menu(),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PropertyEdit()),
                          );
                        },
                        child:
                            kMenus("assets/images/property.png", "My Properties"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Settings()),
                          );
                        },
                        child: kMenus("assets/images/settings.png", "Settings"),
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => NotifyAppbar()),
                    //       );
                    //     },
                    //     child: kMenus("assets/images/message.png", "Messages"),
                    //   ),
                    // ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                        child: kMenus("assets/images/profile.png", "Profile"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    // Expanded(
                    //   flex: 1,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => FavoriteAppbar()),
                    //       );
                    //     },
                    //     child: kMenus("assets/images/favorite.png", "Favorite"),
                    //   ),
                    // ),
                    // Expanded(
                    //   flex: 1,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => Settings()),
                    //       );
                    //     },
                    //     child: kMenus("assets/images/settings.png", "Settings"),
                    //   ),
                    // ),
                    // Expanded(
                    //   flex: 1,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => Package()),
                    //       );
                    //     },
                    //     child: kMenus("assets/images/package.png", "Package"),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          //Field Message
          // Container(
          //   height: 60,
          //   padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: <Widget>[
          //       Expanded(
          //         flex: 1,
          //         child: Row(
          //           children: <Widget>[
          //             Icon(
          //               MaterialCommunityIcons.message,
          //               color: Colors.black,
          //               size: 18,
          //             ),
          //             Text(
          //               '  RECENT MESSAGES',
          //               style: TextStyle(
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 12,
          //                   fontFamily: 'Semibold'),
          //             ),
          //           ],
          //         ),
          //       ),
          //       TextButton(
          //           style: ButtonStyle(
          //             backgroundColor: MaterialStateProperty.all(
          //               Colors.grey[300],
          //             ),
          //             shape: MaterialStateProperty.all(
          //               RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(5.0),
          //               ),
          //             ),
          //           ),
          //           // color: Colors.grey[300],
          //           // shape: RoundedRectangleBorder(
          //           //   borderRadius: new BorderRadius.circular(15.0),
          //           // ),
          //           child: Text(
          //             'SEE ALL',
          //             style: TextStyle(
          //                 color: Colors.black,
          //                 fontSize: 10,
          //                 fontFamily: 'Regular'),
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => NotifyAppbar()),
          //             );
          //           }),
          //     ],
          //   ),
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => AgentDetail()),
          //     );
          //   },
          //   child: FieldMessage(),
          // ),
        ],
      ),
    );
  }

//kMenus
  Widget kMenus(String image, String name) {
    return Container(
      height: 110,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: new BorderRadius.all(new Radius.circular(5))),
        padding: EdgeInsets.only(left: 15, right: 15, top: 20,),
        margin: EdgeInsets.all(0.5),
        child: Column(
          children: <Widget>[
            Image.asset(
              "" + image,
              width: 40,
              height: 40,
            ),
            Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  '' + name,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Regular",
                    fontSize: 12,
                  ),
                ))
          ],
        ));
  }
}
