
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../services/user_db.dart';

class UserController extends GetxController {

  final  _userModel = UserModel().obs;
  UserModel get userModel => _userModel.value;
  set setUserModel(UserModel user) => this._userModel.value = user;

  final _loading = false.obs;
  bool get loading => _loading.value;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  String genderSelected;




  @override
  void onInit() {
    setValues();
    super.onInit();
  }

  ///TODO updateValues
  setValues(){
    firstNameController.text = userModel.firstName;
    lastNameController.text = userModel.lastName;
    genderSelected = userModel.gender;
    emailController.text = userModel.email;
    phoneNoController.text = userModel.phoneNo;

  }

  void clear(){_userModel.value = UserModel();}

  getCurrentUser(String id) async {
    _userModel.value = await UserDatabase().getUser(id);
  }


  void updateUserController(UserModel userModel) {
    _userModel.update((val) {
      val?.firstName = userModel.firstName;
      val?.city = userModel.city;
    });
  }

  void signOut(){
 ///   Get.offAll(()=>WelcomePage());
    FirebaseAuth.instance.signOut();
  }

  void updateUserProfilePhoto(String profileURL){
    _userModel.update((val) {
      val.profileURL = profileURL;
    });
  }

  Future<bool> updateUserBasicData() async{
    try {

    await FirebaseFirestore.instance.collection("Users").doc(userModel.id).update({
        "firstName" : firstNameController.text,
        "lastName" : lastNameController.text,
        "gender" : genderSelected,
        "modifiedOn" : DateTime.now(),
      });
    userModel.firstName = firstNameController.text;
    userModel.lastName = lastNameController.text;
    userModel.gender = genderSelected;

    Get.back();
      Get.snackbar("Success","Changes Saved",snackPosition: SnackPosition.BOTTOM);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }

  Future<bool> updateUserContactData() async{

    try {
      await FirebaseFirestore.instance.collection("Users").doc(userModel.id).update({
        "phoneNo" : phoneNoController.text,
        "email" : emailController.text,
        "modifiedOn" : DateTime.now(),
      });

      userModel.phoneNo = phoneNoController.text;
      userModel.email = emailController.text;

      Get.back();
      Get.snackbar("Success","Changes Saved",snackPosition: SnackPosition.BOTTOM);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }



  void updateUserProfile(name,username,city)async{
    try {
      _userModel.update((val) {
        val?.firstName = name;
        val?.city = city;
      });
      await FirebaseFirestore.instance.collection("Users").doc(_userModel.value.id).update({
        "name":name ,
        "city":city ,
        "modifiedOn" : DateTime.now() ,
      });
      Get.back();
      Get.snackbar("Success","Changes Saved",snackPosition: SnackPosition.BOTTOM);
    }catch(e){
      print(e);
    }
  }

}