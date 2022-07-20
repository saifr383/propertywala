import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/user_controller.dart';

class TilesContact extends StatelessWidget {

  final Function onTap;
  UserController userController = Get.find();
  TilesContact({@required this.onTap});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // final List<String> gender = ["Male", "FeMale"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
      child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              validator: (value){
                if(value.isEmpty || value == null)
                  return "Field required";
                else
                  return null;
              },
              controller: userController.phoneNoController,
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular"),
              decoration: InputDecoration(
                label: Text("Your Mobile Number"),
                hintText: 'Your Mobile Number',
                hintStyle: TextStyle(
                    color: Colors.grey, fontSize: 12, fontFamily: "Regular"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              enabled: false,
              validator: (value){
                if(value.isEmpty || value == null)
                  return "Field required";
                else
                  return null;
              },
              controller: userController.emailController,
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Regular"),
              decoration: InputDecoration(
                label: Text('Your Email Address'),
                hintText: 'Your Email Address',
                hintStyle: TextStyle(
                    color: Colors.grey, fontSize: 12, fontFamily: "Regular"),
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(5),
          //   child: TextField(
          //     style: TextStyle(
          //         color: Colors.black, fontSize: 12, fontFamily: "Regular"),
          //     decoration: InputDecoration(
          //       hintText: 'Your Website URL',
          //       hintStyle: TextStyle(
          //           color: Colors.grey, fontSize: 12, fontFamily: "Regular"),
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () async{
              if(_formKey.currentState.validate()){
                await onTap();
              }
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Color(0xFFFCC300),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(5),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: "Semibold"),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 20,
                    )
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
