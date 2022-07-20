import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/bannerModel.dart';
import '../models/propertyModel.dart';
import '../models/user.dart';

class UserDatabase{

  var userRef =  FirebaseFirestore.instance.collection("Users");

  Future<bool> createUser(UserModel user) async {
    try{
     await userRef.doc(user.id).set(user.toMap());
      return true ;
    }
    catch(e){
      print(e);
      Get.snackbar("error", e.toString(),snackPosition: SnackPosition.BOTTOM ) ;
      return false ;
    }
  }

  Future<void> updateUserProfilePhoto(String id,String photoURL)async {
    try{
      await userRef.doc(id).update({
        "profileURL": photoURL ,
      });
    }
    catch(e){
      print(e);
      Get.snackbar("error", e.toString(),snackPosition: SnackPosition.BOTTOM ) ;
    }
  }

  Future<bool> updateCreatorField(String id) async {

    try{
     await userRef.doc(id).update({
        "isCreator": true ,
      });
      return true ;
    }
    catch(e){
      print(e);
      Get.snackbar("error", e.toString(),snackPosition: SnackPosition.BOTTOM ) ;
      return false ;
    }

  }

  Future<UserModel>  getUser (String id) async {
    try{
      DocumentSnapshot doc = await userRef.doc(id).get();
      return UserModel.fromFirestore(doc) ;
    }
    catch(e){
      print(e);
      Get.snackbar("error", e.toString(),snackPosition: SnackPosition.BOTTOM ) ;
      rethrow ;
    }
  }

  static Future<bool> checkUserExist(String docID) async {
    bool exists = false;
    try {
      await FirebaseFirestore.instance.doc("Users/$docID").get().then((doc) {
        if (!doc.exists)
          exists = false;
        else
          exists = true;
      });
      return exists;
    } catch (e) {
      return false;
    }

  }
  static void uploadAdd(PropertyModel data) async {
    try {
      await FirebaseFirestore.instance.collection('Area').add(data.toMap());

    } catch (e) {
      print(e);
    }

  }
  static void uploadBanner(BannerModel data) async {
    try {
      await FirebaseFirestore.instance.collection('Banner').add(data.toMap());

    } catch (e) {
      print(e);
    }

  }

}