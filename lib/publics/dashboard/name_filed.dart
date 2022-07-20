import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../backend/controllers/user_controller.dart';

class FieldName extends StatelessWidget {
  UserController _userController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Image.asset(
            'assets/images/homebg.png',
            height: 180,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(margin: EdgeInsets.only(top: 40,left: 10,right: 10),
                child: Image.asset(
                  "assets/images/profile.png",
                  width: 50,
                  height: 50,
                ),),

              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 5,top: 50),
                      child: Text(
                        'Hey ${(_userController.userModel.firstName)}',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Regular',
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text(
                      _userController.userModel.email,
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Regular',
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
