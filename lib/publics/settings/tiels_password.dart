import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TilesPassword extends StatelessWidget {
  TextEditingController _passcontroller=TextEditingController();
  TextEditingController _conpasscontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
      child: Column(children: <Widget>[

        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
            controller: _passcontroller,
            style: TextStyle(color: Colors.black, fontSize: 12,fontFamily: "Regular"),
            decoration: InputDecoration(
              hintText: 'New Password',
              hintStyle:TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Regular"),)
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
            controller: _conpasscontroller,
            style:  TextStyle(color: Colors.black, fontSize: 12,fontFamily: "Regular"),
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              hintStyle:  TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Regular"),)
          ),
        ),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFFCC300),
              borderRadius: BorderRadius.all(
                const Radius.circular(5),
              ),
            ),
            child: InkWell(
              onTap: (){
                try
                {
                  if (_passcontroller.text == _conpasscontroller.text) {
                    FirebaseAuth.instance.currentUser
                        .updatePassword(_passcontroller.text);
                    Get.snackbar(
                        "Sucessful", 'Password has been reset sucessfully');
                  } else
                    Get.snackbar("Error",
                        'Password doesnot match with confirm password');
                }
               catch(e){
                 Get.snackbar("Error",
                     e);
                }
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      'SAVE',
                      style: TextStyle(color: Colors.black, fontSize: 12,fontFamily: "Semibold"),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 20,
                  )
                ],
              ),
            )),
      ]),
    );
  }
}
