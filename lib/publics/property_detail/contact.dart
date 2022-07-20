import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/backend/models/user.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/main.dart';

Widget kContact(BuildContext context, UserModel userModel) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(top: 30, bottom: 30),
    child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            'Contact Agent',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontFamily: "Semibold"),
          ),
        ),
        InkWell(
          child: new Container(
            height: 100.0,
            width: 100.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300], width: 6),
              // image: new Image.asset(_image.)
            ),
            child: Image.asset(
              'assets/images/profile.png',
              height: 80,
              width: 80,
            ),
          ),
          // onTap: () {
          //   // Navigator.push(
          //   //   context,
          //   //   MaterialPageRoute(builder: (context) => AgentDetail()),
          //   // );
          // },
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            userModel.firstName + " ${userModel.lastName}",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontFamily: "Semibold"),
          ),
        ),
        Text(
          userModel.city ?? "City",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey, fontSize: 12, fontFamily: "Semibold"),
        ),
      ],
    ),
  );
}
