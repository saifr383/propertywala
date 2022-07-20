

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/backend/utils/authWrapper.dart';
import 'package:myyaowrealtorfltheme/publics/welcome/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    screenFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
          child: Center(
            child: Image.asset("assets/images/logo.png",height: 250,width: 250,),
          )
      ),

    );
  }
  screenFunction() async {
    print('hrllllllllllllllllllllllllllll');
    await Future.delayed(const Duration(seconds: 3));
    print('hrllllllllllllllllllllllllllll');
      Get.off(AuthWrapper());
  }

}
