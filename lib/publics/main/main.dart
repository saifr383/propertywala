import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/auth_controller.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/user_controller.dart';
import 'package:myyaowrealtorfltheme/publics/Profile/main.dart';
import 'package:myyaowrealtorfltheme/publics/about/main.dart';
import 'package:myyaowrealtorfltheme/publics/add_property/main.dart';
import 'package:myyaowrealtorfltheme/publics/contact/main.dart';
import 'package:myyaowrealtorfltheme/publics/dashboard/main.dart';
import 'package:myyaowrealtorfltheme/publics/favorite/main.dart';
import 'package:myyaowrealtorfltheme/publics/home/admin/addbanner.dart';
import 'package:myyaowrealtorfltheme/publics/home/admin/single_boost_ad_widget.dart';

import 'package:myyaowrealtorfltheme/publics/home/main.dart';
import 'package:myyaowrealtorfltheme/publics/search/main.dart';
import 'package:myyaowrealtorfltheme/publics/settings/main.dart';

import '../../customer/signin/main.dart';
import '../home/admin/admin_screen.dart';
import '../notlogin/notlogin.dart';

class PublicMain extends StatefulWidget {
  PublicMain({Key key, this.title}) : super(key: key);
  final String title;
  @override
  PublicMainState createState() => PublicMainState();
}

class PublicMainState extends State<PublicMain> {
  UserController _userController=Get.find();
  int _currentIndex = 0;
  List<Widget> _children;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  User user = Get.find<AuthController>().user;
  List<String> _kAppbarName = [
    "HOME",

    "DASHBOARD",
    "FAVORITE",
  ];

  String kAppbarName;
  @override
  void initState() {
    kAppbarName = _kAppbarName[0];
    _children = [
      Home(),

      user==null?NotLoggedInScreen():DashBoard(),
      user==null?NotLoggedInScreen():Favorite(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xFF265229),
          statusBarIconBrightness: Brightness.light),
    );
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF265229),
      appBar: AppBar(
        titleSpacing: 0.00,
        brightness: Brightness.dark,
        backgroundColor: Color(0xFF265229),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              kAppbarName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Semibold',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        elevation: 0.0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              MaterialCommunityIcons.text,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body:
      loading ? Center(child: CircularProgressIndicator(),)
      : _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        fixedColor: Color(0xFF265229),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.face_profile),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.heart),
            label: "",
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
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
                        user==null?'Guest':_userController.userModel.firstName??'',
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
                onTap: () {
scaffoldKey.currentState.openEndDrawer();
                },
              ),
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
              //
              //     ///TODO WHAT TYPE OF PROPERTIES
              //
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => Property()),
              //     // );
              //   },
              // ),
              user==null?Container(): FirebaseAuth.instance.currentUser.email == "admin@admin.com" ?
              ListTile(
                leading: Icon(
                  Icons.admin_panel_settings,
                  color: Colors.black,
                  size: 25,
                ),
                title: Text(
                  'Review Ads',
                  style: TextStyle(
                      color: Colors.black, fontSize: 13, fontFamily: "Regular"),
                ),
                onTap: () {
                  Get.to(()=>PendingPropertiesAdmin());
                  ///TODO WHAT TYPE OF PROPERTIES

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Property()),
                  // );
                },
              )
              : SizedBox(height: 0,),
              user==null?Container():FirebaseAuth.instance.currentUser.email == "admin@admin.com" ?
              ListTile(
                leading: Icon(
                  Icons.rocket,
                  color: Colors.black,
                  size: 25,
                ),
                title: Text(
                  'Boost Ads',
                  style: TextStyle(
                      color: Colors.black, fontSize: 13, fontFamily: "Regular"),
                ),
                onTap: () {
                  Get.to(()=> AddBanner());
                  ///TODO WHAT TYPE OF PROPERTIES


                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Property()),
                  // );
                },
              )
                  : SizedBox(height: 0,),
              user==null?Container(): FirebaseAuth.instance.currentUser.email == "admin@admin.com" ?
              ListTile(
                leading: Icon(
                  Icons.list,
                  color: Colors.black,
                  size: 25,
                ),
                title: Text(
                  'Current Banners',
                  style: TextStyle(
                      color: Colors.black, fontSize: 13, fontFamily: "Regular"),
                ),
                onTap: () {
                  Get.to(()=> currentbanner());
                  ///TODO WHAT TYPE OF PROPERTIES


                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Property()),
                  // );
                },
              )
                  : SizedBox(height: 0,),


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
              // // ),
              // ListTile(
              //   leading: Icon(
              //     MaterialCommunityIcons.alert_box_outline,
              //     color: Colors.black,
              //     size: 25,
              //   ),
              //   title: Text(
              //     'About Property Waly',
              //     style: TextStyle(
              //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => About()),
              //     );
              //   },
              // ),
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
                  user==null?  Get.to(() => NotLoggedInScreen(size: true,)): Get.to(()=>AddProperties(area: true),transition:Transition.circularReveal,duration: Duration(milliseconds: 500) );

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
              // ListTile(
              //   leading: Icon(
              //     Icons.person,
              //     color: Colors.black,
              //     size: 25,
              //   ),
              //   title: Text(
              //     'Profile',
              //     style: TextStyle(
              //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => Profile()),
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: Icon(
              //     MaterialCommunityIcons.heart,
              //     color: Colors.black,
              //     size: 25,
              //   ),
              //   title: Text(
              //     'Favorite',
              //     style: TextStyle(
              //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //         context, MaterialPageRoute(builder: (context) => Favorite()));
              //   },
              // ),
              // ListTile(
              //   leading: Icon(
              //     MaterialCommunityIcons.image,
              //     color: Colors.black,
              //     size: 25,
              //   ),
              //   title: Text(
              //     'Settings',
              //     style: TextStyle(
              //         color: Colors.black, fontSize: 13, fontFamily: "Regular"),
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => Settings()),
              //     );
              //   },
              // ),
              user==null? ListTile(
                leading: Icon(
                  MaterialCommunityIcons.logout,
                  color: Colors.black,
                  size: 25,
                ),
                title: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black, fontSize: 13, fontFamily: "Regular"),
                ),
                onTap: () {
                  Get.offAll(()=>SignIn());
                },
              ): ListTile(
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
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      kAppbarName = _kAppbarName[index];
    });
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(
            "EXIT",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontFamily: "Semibold"),
          ),
          content: new Text(
            "Are you sure you want to exit?",
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontFamily: "Regular"),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text(
                "Exit",
                style: TextStyle(
                    color: Colors.red, fontSize: 12, fontFamily: "Semibold"),
              ),
              onPressed: () async {
                AuthController _controller = Get.find();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                setState(() {
                  loading = true;
                });
                await _controller.signOut();
                loading = false;

              },
            ),
            new TextButton(
              child: new Text(
                "Cancel",
                style: TextStyle(
                    color: Colors.green, fontSize: 12, fontFamily: "Semibold"),
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

