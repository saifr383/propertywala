import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserModel {

  String id;
  String firstName;
  String lastName;
  DateTime createdAt;
  String email;
  String profileURL;
  DateTime modifiedAt;
  String city;
  String genre;
  String bio ;
  double rating;
  String phoneNo;
  List<dynamic> likes;
  String gender;


  UserModel({
      this.id,
      this.firstName,
    this.lastName,
      this.createdAt,
      this.email,
      this.profileURL,
      this.modifiedAt,
      this.city,
      this.bio,
      this.genre,
      this.rating,
    this.phoneNo,
  this.likes,
   @required this.gender
  });

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName,
      "lastName" : lastName,
      "email": email,
      "createdAt": createdAt,
      "profileURL": profileURL,
      "modifiedAt": modifiedAt,
      "city": city,
      "bio": bio,
      "genre": genre,
      "phoneNo" : phoneNo,
      "gender" : gender

    };
  }

  factory UserModel.fromFirestore(DocumentSnapshot snapshot) {
    print('updattttttttttttttttttttttttttttttting');

    Map data = snapshot.data() as Map;
    print(data['likes']);
    return UserModel(
      id: snapshot.id,
      firstName: data["firstName"],
      lastName: data['lastName'],
      email: data["email"],
      createdAt: data["createdAt"].toDate(),
      modifiedAt: data["modifiedAt"].toDate(),
      profileURL: data["profileURL"],
      city: data["city"],
      phoneNo: data['phoneNo'],
likes: data['likes']??[],
      gender:  data["gender"]
    );
  }
}
