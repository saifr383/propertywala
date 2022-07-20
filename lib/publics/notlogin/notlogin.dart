import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../customer/signin/main.dart';




class NotLoggedInScreen extends StatelessWidget {
  bool size=false;
   NotLoggedInScreen({Key key,this.size=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height =size?MediaQuery.of(context).size.height-100: MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor: Colors.white,leading:!size?SizedBox(): IconButton(onPressed: (){Get.back();},icon: Icon(Icons.arrow_back,color: Colors.black,size: 35,),),),
      body: Container(
        color: Colors.white,
        width: Get.width,

        height: _height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ColorFiltered(
                child: Image.asset(
                  'assets/images/guest_login.png',
                  width: MediaQuery.of(context).size.height*0.4,
                  height: MediaQuery.of(context).size.height*0.4,

                ),
                colorFilter: ColorFilter.mode( Color(0xFF265229), BlendMode.color)
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03),

            Text(
              'Guest Mode',
              style:TextStyle(
                color: Color(0xFF265229),
                fontFamily: 'Semibold',
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),

            Text(
              'Now You are in Guest Mode',
              style:TextStyle(
                color: Color(0xFF265229),
                fontFamily: 'Semibold',
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03),

            SizedBox(
              width: 100,
              height: 40,
              child: CustomButton(btnTxt:'login', onTap: () {
                Get.offAll(()=>SignIn());;
              }),
            ),
SizedBox(height: size?100:50,),

          ],
        ),
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  final Function onTap;
  final String btnTxt;
  final Color backgroundColor;
  CustomButton({this.onTap, @required this.btnTxt, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Color(0xFF265229),
      minimumSize: Size(300, 100),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return TextButton(
      onPressed: onTap,
      style: flatButtonStyle,
      child: Text(btnTxt??"",
          style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold)),
    );
  }
}