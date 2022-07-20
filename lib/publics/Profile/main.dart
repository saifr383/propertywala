import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/user_controller.dart';
import 'package:myyaowrealtorfltheme/publics/Profile/tiles_basic.dart';
import 'package:myyaowrealtorfltheme/publics/Profile/tiles_contact.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  UserController userController = Get.find();

  bool checkBoxValue = false;
  List<String> _gender = ["Male", "FeMale"];
  List<IconData> _icon = [
    Icons.add,
    Icons.remove,
  ];
  String kcurrentCity;
  bool basic = false;
  bool address = false;
  bool contact = false;
  bool media = false;
  int _basic = 0;
  int _address = 0;
  int _contact = 0;
  int _media = 0;

  @override
  void initState() {
    super.initState();
    userController.setValues();
    kcurrentCity = _gender[0];
  }

  bool loading = false;
  // UserController userController = Get.find();

  // setValues(){
  //   userController.userModel.
  // }

  @override
  Widget build(BuildContext context) {
    print("profile build called");
    return Scaffold(
        backgroundColor: Colors.white,
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(scrollDirection: Axis.vertical, children: <Widget>[
                kHeader(context),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 1),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(
                        const Radius.circular(5),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Basic',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "Semibold"),
                          ),
                        ),
                        Icon(
                          _icon[_basic],
                          color: Colors.black,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (basic == true) {
                        _basic = 0;
                        _address = 0;
                        _media = 0;
                        _contact = 0;
                        basic = false;
                        address = false;
                        contact = false;
                        media = false;
                      } else {
                        _basic = 1;
                        _address = 0;
                        _media = 0;
                        _contact = 0;
                        basic = true;
                        address = false;
                        contact = false;
                        media = false;
                      }
                    });
                  },
                ),
                Visibility(
                  child: TilesBasic(
                    onTap: ()async{
                      setState(() {
                        loading = true;
                      });
                      bool status = await userController.updateUserBasicData();
                      if (!status) {
                        setState(() {
                          loading = false;
                        });
                      }
                      else{
                        loading = false;
                      }
                    },
                  ),
                  visible: basic,
                ),
                // InkWell(
                //   child: Container(
                //     margin: EdgeInsets.only(left: 20, right: 20, bottom: 1),
                //     padding: EdgeInsets.all(15),
                //     decoration: BoxDecoration(
                //       color: Colors.grey[300],
                //       borderRadius: BorderRadius.all(
                //         const Radius.circular(5),
                //       ),
                //     ),
                //     child: Row(
                //       children: <Widget>[
                //         Expanded(
                //           flex: 1,
                //           child: Text(
                //             'Address Information',
                //             style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 12,
                //                 fontFamily: "Semibold"),
                //           ),
                //         ),
                //         Icon(
                //           _icon[_address],
                //           color: Colors.black,
                //           size: 15,
                //         )
                //       ],
                //     ),
                //   ),
                //   onTap: () {
                //     setState(() {
                //       if (address == true) {
                //         _basic = 0;
                //         _address = 0;
                //         _media = 0;
                //         _contact = 0;
                //         basic = false;
                //         address = false;
                //         contact = false;
                //         media = false;
                //       } else {
                //         _address = 1;
                //         _basic = 0;
                //         _media = 0;
                //         _contact = 0;
                //         basic = false;
                //         address = true;
                //         contact = false;
                //         media = false;
                //       }
                //     });
                //   },
                // ),
                // Visibility(
                //   child: TilesAddress(),
                //   visible: address,
                // ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 1),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(
                        const Radius.circular(5),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Contact Information',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "Semibold"),
                          ),
                        ),
                        Icon(
                          _icon[_contact],
                          color: Colors.black,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (contact == true) {
                        _basic = 0;
                        _address = 0;
                        _media = 0;
                        _contact = 0;
                        basic = false;
                        address = false;
                        contact = false;
                        media = false;
                      } else {
                        _basic = 0;
                        _address = 0;
                        _media = 0;
                        _contact = 1;
                        basic = false;
                        address = false;
                        contact = true;
                        media = false;
                      }
                    });
                  },
                ),
                Visibility(
                  child: TilesContact(
                    onTap: ()async{
                      setState(() {
                        loading = true;
                      });
                      bool status = await userController.updateUserContactData();
                      if (!status) {
                        setState(() {
                          loading = false;
                        });
                      }
                      else{
                        loading = false;
                      }

                    },
                  ),
                  visible: contact,
                ),
                // InkWell(
                //   child: Container(
                //     margin: EdgeInsets.only(left: 20, right: 20, bottom: 1),
                //     padding: EdgeInsets.all(15),
                //     decoration: BoxDecoration(
                //       color: Colors.grey[300],
                //       borderRadius: BorderRadius.all(
                //         const Radius.circular(5),
                //       ),
                //     ),
                //     child: Row(
                //       children: <Widget>[
                //         Expanded(
                //           flex: 1,
                //           child: Text(
                //             'Social Media',
                //             style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 12,
                //                 fontFamily: "Semibold"),
                //           ),
                //         ),
                //         Icon(
                //           _icon[_media],
                //           color: Colors.black,
                //           size: 15,
                //         )
                //       ],
                //     ),
                //   ),
                //   onTap: () {
                //     setState(() {
                //       if (media == true) {
                //         _basic = 0;
                //         _address = 0;
                //         _media = 0;
                //         _contact = 0;
                //         basic = false;
                //         address = false;
                //         contact = false;
                //         media = false;
                //       } else {
                //         _basic = 0;
                //         _address = 0;
                //         _media = 1;
                //         _contact = 0;
                //         basic = false;
                //         address = false;
                //         contact = false;
                //         media = true;
                //       }
                //     });
                //   },
                // ),
                // Visibility(
                //   child: TilesMedia(),
                //   visible: media,
                // ),
              ]));
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      kcurrentCity = selectedCity;
    });
  }
  Widget kHeader(BuildContext context) {
    return Container(
      color: Color(0xFF265229),
      height: 230,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/face.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Color(0xFF265229).withOpacity(0.8),
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () => Navigator.of(context)
                  .pop(),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 90.0,
                height: 90.0,
                margin: EdgeInsets.all(5),
                decoration: new BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: new DecorationImage(
                    image: new NetworkImage(
                      'https://images.unsplash.com/photo-1489779162738-f81aed9b0a25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(80.0)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                 userController.userModel.firstName,
                  style: TextStyle(
                      color: Colors.white, fontSize: 14, fontFamily: "Semibold"),
                ),
              ),
              Text(
                userController.userModel.email,
                style: TextStyle(
                    color: Colors.white70, fontSize: 12, fontFamily: "Regular"),
              )
            ],
          )
        ],
      ),
    );
  }
}


