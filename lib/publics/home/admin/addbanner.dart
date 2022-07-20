import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/addproperty_controller.dart';

import '../../../backend/controllers/bindings/addbanner_controller.dart';
import '../../../backend/models/bannerModel.dart';
import '../../../backend/services/user_db.dart';

class AddBanner extends StatefulWidget {
  @override
  AddBannerState createState() => AddBannerState();
}

class AddBannerState extends State<AddBanner> {
  AddBannerController _addPropertyController =
      Get.put(AddBannerController());
  XFile data = null;

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
                    var imgFile = await _picker.pickImage(
                        source: ImageSource.camera, imageQuality: 10);

                    if (imgFile != null) {
                      print('///////////////////////////////');
                      data = imgFile;
                      setState(() {});
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

                    var imgFile = await _picker.pickImage(
                        source: ImageSource.gallery, imageQuality: 10);
                    if (imgFile != null) {
                      data = imgFile;
                      setState(() {});
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

  @override
  Widget build(BuildContext context) {
    return GetX<AddBannerController>(
        init: AddBannerController(),
        builder: (_addPropertyController) {
          return ModalProgressHUD(
            inAsyncCall: _addPropertyController.loading.value,
            child: Scaffold(
              appBar:AppBar(
                backgroundColor: Color(0xFF265229),
                title: Text(
                  'Add Banner',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Semibold',
                    fontSize: 14,
                  ),
                ),
                elevation: 0.0,
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),

              ),
              floatingActionButton: FloatingActionButton(child: Icon(Icons.save,color: Colors.white,),onPressed: () async {

                _addPropertyController.loading.value =
                true;
                String uploadedimage =
                await _addPropertyController
                    .uploadImageToFirebase(
                data);
                UserDatabase.uploadBanner(
                BannerModel(
                _addPropertyController
                    .nameController.text,
                   _addPropertyController
                    .desController.text,
            uploadedimage

                )
                );

                Get.back();

              },),
              body: Container(
                margin: EdgeInsets.all(20),
                child: ListView(
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Form(
                          key: _addPropertyController.formKeyPage1,
                          child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start
                              ,children: [
                            Text(
                              'Property Name',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "Regular"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 30),
                              padding: EdgeInsets.only(
                                  right: 20, top: 20, bottom: 20, left: 10),
                              decoration: new BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                  new BorderRadius.all(new Radius.circular(5))),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty || value == "")
                                    return "Field is empty";
                                  return null;
                                },
                                controller: _addPropertyController.nameController,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Regular',
                                    fontSize: 12),
                                cursorColor: Colors.black,
                                decoration: new InputDecoration.collapsed(
                                    hintText: 'e.g.5 Bed Luxury Home near London',
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Regular",
                                        color: Colors.grey)),
                              ),
                            ),
                            Text(
                              'Description',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "Regular"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 30),
                              padding: EdgeInsets.only(
                                  right: 20, top: 20, bottom: 20, left: 10),
                              decoration: new BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                  new BorderRadius.all(new Radius.circular(5))),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty || value == "")
                                    return "Field is empty";
                                  return null;
                                },
                                controller: _addPropertyController.desController,
                                keyboardType: TextInputType.multiline,
                                maxLines: 8,
                                minLines: 8,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'Regular',
                                    fontSize: 13),
                                cursorColor: Colors.black,
                                decoration: new InputDecoration.collapsed(
                                    hintText: 'Minimum 20 characters',
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Regular",
                                        color: Colors.grey)),
                              ),
                            ),
                          Text(
                            'Upload Photos',
                            style: TextStyle(
                                color: Colors.black, fontSize: 12, fontFamily: "Semibold"),
                          ),
                          GestureDetector(
                            onTap: () {
                              ImagePickerSheet();
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10, bottom: 30),
                              height: 150,
                              decoration: new BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: new BorderRadius.all(new Radius.circular(5))),
                              child: Center(
                                child: Container(
                                  width: 200,
                                  padding: EdgeInsets.all(10),
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(width: 2, color: Colors.black),
                                      borderRadius:
                                      new BorderRadius.all(new Radius.circular(25))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.file_upload,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        ' SELECT PHOTOS',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: "Regular"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                            if (data != null)
                              Image.file(
                                File(
                                  data.path,
                                ),
                                height: 150,
                                width: Get.width,
                                fit: BoxFit.fill,
                              ),
                          ]))
                    ]),
              ),
            ),
          );
        });

  }
}
