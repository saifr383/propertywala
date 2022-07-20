import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/main.dart';
import 'package:myyaowrealtorfltheme/publics/home/main.dart';
import 'package:myyaowrealtorfltheme/publics/main/main.dart';
import 'package:myyaowrealtorfltheme/publics/welcome/main.dart';

import '../../customer/signin/main.dart';
import '../controllers/auth_controller.dart';
import '../controllers/user_controller.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('hellllllllllllllllllllll');
    if(FIRST_RUN)
      return Welcome();

    return GetX<UserController>(
      builder: (UserController controller) {
        print('hellllllllllllllllllllll');
        User user = Get.find<AuthController>().user;
        if(user == null){
          return SignIn() ;
        }else{
         controller.getCurrentUser(user.uid);
          ///   return RootPage();
          return PublicMain();
        }
      },
    );
  }
}



