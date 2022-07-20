import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/auth_controller.dart';

class MyDrawer extends StatefulWidget {

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    // final imageUrl = user.imgUrl;
    return
      Drawer(
       child:
       loading ?
       Center(child: CircularProgressIndicator(),) :
       Container(
        // color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              // color: Colors.green[700],
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.green[700]
                  ),
                  margin: EdgeInsets.zero,
                  accountName: Text("appUser.userName"),
                  accountEmail: Text("FirebaseAuth.instance.currentUser.phoneNumber"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/face.jpg"),
                    // backgroundImage: NetworkImage(appUser.imgUrl),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.green[700],
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.green,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            InkWell(
              onTap: () async{
                AuthController controller = Get.find();
                setState(() {
                  loading = true;
                });
                await controller.signOut();
                loading = false;
              },
              child: ListTile(
                leading: Icon(
                  Icons.logout_sharp,
                  color: Colors.green,
                ),
                title: Text(
                  "Log Out",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    //   }
    // );
  }
}