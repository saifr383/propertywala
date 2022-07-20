import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/publics/Profile/main.dart';
import 'package:myyaowrealtorfltheme/publics/about/main.dart';
import 'package:myyaowrealtorfltheme/publics/add_property/main.dart';
import 'package:myyaowrealtorfltheme/publics/contact/main.dart';
import 'package:myyaowrealtorfltheme/publics/favorite/main.dart';
import 'package:myyaowrealtorfltheme/publics/property/main.dart';
import 'package:myyaowrealtorfltheme/publics/settings/main.dart';

class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF265229),
              // image: DecorationImage(
              //   image: AssetImage("assets/images.jpg"),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  "assets/images/profile.png",
                  width: 50,
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'Kent Perker',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Regular',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  color: Colors.black, fontSize: 13, fontFamily: "Regular"),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.donut_small,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Properties',
              style: TextStyle(
                  color: Colors.black, fontSize: 13, fontFamily: "Regular"),
            ),
            onTap: () {

              ///WHERE TO GO WHAT PROPERTIES TO SHOW

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Property()),
              // );
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.find_in_page,
          //     color: Colors.black,
          //     size: 25,
          //   ),
          //   title: Text(
          //     'Properties Details',
          //     style: TextStyle(
          //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => PropertyDetail()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     MaterialCommunityIcons.book_search,
          //     color: Colors.black,
          //     size: 25,
          //   ),
          //   title: Text(
          //     'Properties Search',
          //     style: TextStyle(
          //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Search()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     MaterialCommunityIcons.face_agent,
          //     color: Colors.black,
          //     size: 25,
          //   ),
          //   title: Text(
          //     'Agents',
          //     style: TextStyle(
          //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Agent()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.people_outline,
          //     color: Colors.black,
          //     size: 25,
          //   ),
          //   title: Text(
          //     'Agent Detail',
          //     style: TextStyle(
          //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => AgentDetail()),
          //     );
          //   },
          // ),
          ListTile(
            leading: Icon(
              MaterialCommunityIcons.alert_box_outline,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'About Property Waly',
              style: TextStyle(
                  color: Colors.black, fontSize: 13, fontFamily: "Regular"),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contact_phone,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Contact',
              style: TextStyle(
                  color: Colors.black, fontSize: 13, fontFamily: "Regular"),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contact()),
              );
            },
          ),
          Divider(
            color: Colors.black87,
            height: 1,
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.person_pin,
          //     color: Colors.black,
          //     size: 25,
          //   ),
          //   title: Text(
          //     'Register',
          //     style: TextStyle(
          //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Register()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.perm_contact_calendar,
          //     color: Colors.black,
          //     size: 25,
          //   ),
          //   title: Text(
          //     'Sign In',
          //     style: TextStyle(
          //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => SignIn()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     MaterialCommunityIcons.monitor_dashboard,
          //     color: Colors.black,
          //     size: 25,
          //   ),
          //   title: Text(
          //     'Dashboard',
          //     style: TextStyle(
          //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => DashBoard()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.donut_small,
          //     color: Colors.black,
          //     size: 25,
          //   ),
          //   title: Text(
          //     'Properties',
          //     style: TextStyle(
          //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Property()),
          //     );
          //   },
          // ),
          ListTile(
            leading: Icon(
              MaterialCommunityIcons.plus,
              color: Colors.black,
              size: 30,
            ),
            title: Text(
              'Add Properties',
              style: TextStyle(
                  color: Colors.black, fontSize: 13, fontFamily: "Regular"),
            ),
            onTap: () {
              Get.to(()=>AddProperties(),transition:Transition.leftToRightWithFade,duration: Duration(seconds: 5) );
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     MaterialCommunityIcons.message,
          //     color: Colors.black,
          //     size: 25,
          //   ),
          //   title: Text(
          //     'Messages',
          //     style: TextStyle(
          //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Notify()),
          //     );
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                  color: Colors.black, fontSize: 13, fontFamily: "Regular"),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              MaterialCommunityIcons.heart,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Favorite',
              style: TextStyle(
                  color: Colors.black, fontSize: 13, fontFamily: "Regular"),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Favorite()));
            },
          ),
          ListTile(
            leading: Icon(
              MaterialCommunityIcons.image,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                  color: Colors.black, fontSize: 13, fontFamily: "Regular"),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              MaterialCommunityIcons.logout,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                  color: Colors.black, fontSize: 13, fontFamily: "Regular"),
            ),
            onTap: () {
              _showDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(
            "Exit",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: "Semibold"),
          ),
          content: new Text(
            "Are you sure you want to exit?",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontFamily: "Regular"),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text(
                "Exit",
                style: TextStyle(
                    color: Colors.red, fontSize: 14, fontFamily: "Regular"),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new TextButton(
              child: new Text(
                "Cancel",
                style: TextStyle(
                    color: Colors.green, fontSize: 14, fontFamily: "Regular"),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
