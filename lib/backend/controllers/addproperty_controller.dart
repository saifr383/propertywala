
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';


class AddPropertyController extends GetxController{
  TextEditingController nameController=TextEditingController();
  TextEditingController nearController=TextEditingController();
  String propertyType='Select';
  String propertySubType='Select';
  TextEditingController desController=TextEditingController();
  int bedroom=0;
  int bathroom=0;
  TextEditingController priceController=TextEditingController();
  TextEditingController areaController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  Rx<String> dhaArea='Select'.obs;
  var image = <XFile>[].obs;
  var loading=false.obs;
  final formKeyPage1 = GlobalKey<FormState>();
  final formKeyPage2 = GlobalKey<FormState>();

   ImagePickerSheet() async {
     Get.bottomSheet(Container(
      color: Colors.white,
      child: Wrap(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: const Text(
                    'Choose Option',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: Get.width,
                  height: 1.0,
                  color: Colors.white.withOpacity(0.8),
                ),
                InkWell(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    var imgFile =
                    await _picker.pickImage(source: ImageSource.camera,imageQuality: 10);

                    if (imgFile != null) {
                      print('///////////////////////////////');
                      image.add(imgFile);


                    }
                    Get.back();


                  },
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          Icons.camera_alt,
//                                  color: Colors.white.withOpacity(0.7),
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('Camera',
                            style: TextStyle(fontSize: 15, color: Colors.blue)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();

                    var imgFile =
                    await _picker.pickMultiImage(imageQuality: 10);
                    if (imgFile != null) {

                      image.addAll(imgFile);


                    }
                    Get.back();
                  },
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          Icons.photo_album,
//                                  color: Colors.white.withOpacity(0.7),
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Upload from Gallery',
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));


  }
  Future<List<String>> uploadFiles(List<XFile> _images) async {
     if(_images.isEmpty)
       return [];
     print(_images[0]);
    var imageUrls = await Future.wait(_images.map((_image) => uploadImageToFirebase(_image)));
    print(imageUrls);
    return imageUrls;
  }
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