
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';


class AddBannerController extends GetxController{
  TextEditingController nameController=TextEditingController();

  TextEditingController desController=TextEditingController();


  final formKeyPage1 = GlobalKey<FormState>();
 var loading=false.obs;



  Future<String> uploadImageToFirebase(XFile _imageFile) async {
    print(_imageFile.path);
    String fileName = const Uuid().v4();
    Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('uploads/$fileName');
    print('///////////////////////////');
    UploadTask uploadTask = firebaseStorageRef.putFile(File(_imageFile.path));
    print('///////////////////////////');
    TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
    String downloadurl = await snapshot.ref.getDownloadURL();
    return downloadurl;
  }


}