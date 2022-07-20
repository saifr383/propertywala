import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:like_button/like_button.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/user_controller.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/main.dart';
import '../../backend/controllers/auth_controller.dart';
import '../../backend/models/propertyModel.dart';

/// LIST OF MAPS
class SinglePropertyAdWidget extends StatelessWidget {
  final PropertyModel propertyModel;

  SinglePropertyAdWidget({Key key, @required this.propertyModel})
      : super(key: key);
  bool islike = false;

  UserController _usercontroller = Get.find();
  User user = Get.find<AuthController>().user;
  @override
  Widget build(BuildContext context) {
    if(user!=null) {
      _usercontroller.userModel.likes.forEach((element) {
        if (element['post'] == propertyModel.uid &&
            element['area'] == propertyModel.dhaArea) {
          islike = true;
        }
      });
    }

    return InkWell(
      onTap: () {
        Get.to(() => PropertyDetail(
              propertyModel: propertyModel,
            ));
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: SizedBox(
          width: Get.width,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.only(
                    topRight: const Radius.circular(5),
                    topLeft: const Radius.circular(5)),
                child: Image.network(
                  propertyModel.images[0],
                  height: 150.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: int.parse(propertyModel.price) >= 100000
                          ? Text(
                              '${int.parse(propertyModel.price) / 100000.0} lakh Rs',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Semibold',
                                  fontSize: 15),
                            )
                          : Text(
                              propertyModel.price + " Rs",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Semibold',
                                  fontSize: 15),
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2, left: 10, bottom: 10),
                      child: Text(
                        '' + propertyModel.address,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Regular'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        propertyModel.propertySubType == 'Plot'
                            ? Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                child: Row(
                                  children: <Widget>[

                                    SizedBox(
                                      width: 30,
                                    ),
                                    Icon(
                                      MaterialCommunityIcons.square,
                                      color: Colors.grey[500],
                                      size: 20,
                                    ),
                                    int.parse(propertyModel.area)>=20?Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '' + (int.parse(propertyModel.area)/20).toString()+' Kanal',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Semibold'),
                                      ),
                                    ):
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '' + propertyModel.area+"Marla",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Semibold'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    LikeButton(
                                      isLiked: islike,
                                      size: 40,
                                      circleColor: CircleColor(
                                          start: Colors.pinkAccent
                                              .withOpacity(0.5),
                                          end: Colors.pink),
                                      bubblesColor: BubblesColor(
                                        dotPrimaryColor:
                                            Colors.pinkAccent.withOpacity(0.5),
                                        dotSecondaryColor: Colors.red,
                                      ),
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          Icons.favorite,
                                          color: isLiked
                                              ? Colors.pink
                                              : Colors.grey,
                                          size: 30,
                                        );
                                      },
                                      onTap: (isliked) async {
                                        if (isliked == false) {
                                          await FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc(FirebaseAuth
                                                  .instance.currentUser.uid)
                                              .update({
                                            'likes': FieldValue.arrayUnion([
                                              {
                                                'post': propertyModel.uid,
                                                'area': propertyModel.dhaArea
                                              }
                                            ])
                                          });
                                        } else if (isliked == true) {
                                          await FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc(FirebaseAuth
                                                  .instance.currentUser.uid)
                                              .update({
                                            'likes': FieldValue.arrayRemove([
                                              {
                                                'post': propertyModel.uid,
                                                'area': propertyModel.dhaArea
                                              }
                                            ])
                                          });
                                        }
                                        _usercontroller.getCurrentUser(
                                            FirebaseAuth
                                                .instance.currentUser.uid);
                                        return !isliked;
                                      },
                                    )
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      MaterialCommunityIcons.bed_empty,
                                      color: Colors.grey[500],
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        (propertyModel.bedroom + 1).toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Semibold'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Icon(
                                      MaterialCommunityIcons.bed_empty,
                                      color: Colors.grey[500],
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        (propertyModel.bathroom + 1).toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Semibold'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Icon(
                                      MaterialCommunityIcons.square,
                                      color: Colors.grey[500],
                                      size: 20,
                                    ),
                                    int.parse(propertyModel.area)>=20?Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '' + (int.parse(propertyModel.area)/20).toString()+' Kanal',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Semibold'),
                                      ),
                                    ):
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '' + propertyModel.area+"Marla",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Semibold'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    LikeButton(
                                      isLiked: islike,
                                      size: 40,
                                      circleColor: CircleColor(
                                          start: Colors.pinkAccent
                                              .withOpacity(0.5),
                                          end: Colors.pink),
                                      bubblesColor: BubblesColor(
                                        dotPrimaryColor:
                                            Colors.pinkAccent.withOpacity(0.5),
                                        dotSecondaryColor: Colors.red,
                                      ),
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          Icons.favorite,
                                          color: isLiked
                                              ? Colors.pink
                                              : Colors.grey,
                                          size: 30,
                                        );
                                      },
                                      onTap: (isliked) async {
                                        if (isliked == false) {
                                          await FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc(FirebaseAuth
                                                  .instance.currentUser.uid)
                                              .update({
                                            'likes': FieldValue.arrayUnion([
                                              {
                                                'post': propertyModel.uid,
                                                'area': propertyModel.dhaArea
                                              }
                                            ])
                                          });
                                        } else if (isliked == true) {
                                          await FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc(FirebaseAuth
                                                  .instance.currentUser.uid)
                                              .update({
                                            'likes': FieldValue.arrayRemove([
                                              {
                                                'post': propertyModel.uid,
                                                'area': propertyModel.dhaArea
                                              }
                                            ])
                                          });
                                        }
                                        _usercontroller.getCurrentUser(
                                            FirebaseAuth
                                                .instance.currentUser.uid);
                                        return !isliked;
                                      },
                                    )
                                  ],
                                ),
                              ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
