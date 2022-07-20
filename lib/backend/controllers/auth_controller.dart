import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/user_controller.dart';
import 'package:myyaowrealtorfltheme/customer/signin/main.dart';
import 'package:myyaowrealtorfltheme/publics/home/main.dart';
import 'package:myyaowrealtorfltheme/publics/main/main.dart';
import '../models/user.dart';
import '../services/user_db.dart';



class AuthController extends GetxController{

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  String selectedGender = null;

  ///Forgot Password
  TextEditingController forgotPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance ;
  final Rxn<User> _firebaseUser = Rxn<User>() ;
  User get user => _firebaseUser.value ;
  UserController userController=Get.find();

  final _loading = false.obs ;
  bool get loading => _loading.value ;


  /// Obscure Text
  var _signUpObscureText = true.obs ;
  bool get getSignUpObscureText => _signUpObscureText.value ;
  void setSignUpObscureText() => _signUpObscureText.value = !_signUpObscureText.value ;


  /// Profile Setup
  // TextEditingController userNameController = new TextEditingController();
  // TextEditingController cityController = new TextEditingController();

  // var _userProfileURL = "".obs ;
  // String get userProfileURL => _userProfileURL.value ;


  // UserController _userController = Get.find<UserController>() ;


  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void signUp()async {
    try{
      _loading.value = true ;
      UserCredential userCredential =  await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      final user = UserModel(
          id: userCredential.user.uid,
          email: emailController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          createdAt: DateTime.now(),
          modifiedAt: DateTime.now(),
        phoneNo: mobileNoController.text,
        gender: selectedGender
      );
      await UserDatabase().createUser(user);
      Get.offAll(()=>Home());
      clearControllers();
      _loading.value = false ;
    }
    catch(e){
      _loading.value = false ;
      Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM);
      print(e);
    }
  }

  void login() async {
    _loading.value = true ;
    try{
      await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

      UserController controller=Get.put(UserController());
      controller.getCurrentUser(FirebaseAuth.instance.currentUser.uid);
      Get.off(()=>PublicMain());
    ///  Get.to(()=>AuthWrapper(),transition: Transition.fadeIn);
      clearControllers();
      _loading.value = false ;
    }
    catch(e){
      _loading.value = false ;
      Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM);
      print(e);
    }
  }

  void sendPasswordResetEmail() async {
    try{
      _loading.value = true ;
      await _auth.sendPasswordResetEmail(email:forgotPasswordController.text);
      Get.back();
      Get.snackbar("Success","Check Your Inbox",snackPosition: SnackPosition.BOTTOM);
      _loading.value = false ;
    }
    catch(e){
      _loading.value = false ;
      Get.snackbar("Error",e.toString(),snackPosition: SnackPosition.BOTTOM);
    }
  }

  void resetEmail() async{
    try{

      _loading.value = true ;
      User firebaseUser = _auth.currentUser ;
      firebaseUser.updateEmail(emailController.text);

      _loading.value = false ;

      Get.back();
      Get.snackbar("Success","Email Updated",snackPosition: SnackPosition.BOTTOM);
    }
    catch(e){
      _loading.value = false ;
      Get.snackbar("Error",e.toString(),snackPosition: SnackPosition.BOTTOM);
    }
  }

  // void setUpUser() async{
  //   _loading.value = true ;
  //   String id = _firebaseUser.value.uid ;
  //   var user = UserModel(name: nameController.text,city: cityController.text);
  //   try {
  //     await FirebaseFirestore.instance.collection("Users").doc(id).update({
  //       "name" : user.name,
  //       "city" : user.city ,
  //     });
  //     _userController.updateUserController(user);
  //  ///   Get.offAll(()=>AuthWrapper());
  //     _loading.value =false;
  //
  //   }catch(e){
  //     print(e);
  //     Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM);
  //     _loading.value = false ;
  //
  //   }
  // }


  Future<void> signOut() async {
    try{
      await _auth.signOut() ;
      Get.find<UserController>().clear();
      Get.offAll(SignIn());
    }
    catch(e){
      print(e);
      Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM);
      print(e);

    }
  }



  void clearControllers(){
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    passwordController.clear();
    mobileNoController.clear();
    // confirmPasswordController.clear();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileNoController.dispose();
    // confirmPasswordController.dispose();
    super.onClose();
  }

}