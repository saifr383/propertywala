import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../backend/controllers/addproperty_controller.dart';

Widget kPhoto(BuildContext context) {

  AddPropertyController _addPropertyController =
      Get.put(AddPropertyController());

  List<String> _image = [
    'assets/images/home.jpg',
    'assets/images/gallery1.jpg',
    'assets/images/gallery2.jpg',
    'assets/images/gallery3.jpg',
    'assets/images/gallery4.jpg',
    'assets/images/gallery1.jpg',
  ];
  return Container(
    margin: EdgeInsets.all(20),
    child: ListView(
        shrinkWrap: false,
        scrollDirection: Axis.vertical,

        children: <Widget>[
          Text(
            'Upload Photos',
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontFamily: "Semibold"),
          ),
          GestureDetector(
            onTap: () {
              _addPropertyController.ImagePickerSheet();
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
          Text(
            'Photos',
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontFamily: "Semibold"),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: Obx(
              ()
              {print('===================================');
                 return  GridView.builder(
                   physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: _addPropertyController.image.value.length,
                      itemBuilder: (con, index) {
                        return kImages(
                            _addPropertyController.image.value[index], context);
                      });
                }),
          ),
        ]),
  );
}

Widget kImages(XFile image, BuildContext context) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: <Widget>[
      Container(
        margin: EdgeInsets.all(2),
        child: ClipRRect(
          borderRadius: new BorderRadius.all(const Radius.circular(5)),
          child: Image.file(
            File(image.path),
            height: 100.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
      InkWell(
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(const Radius.circular(5)),
          ),
          child: Icon(
            Icons.delete_outline,
            color: Colors.red,
            size: 20,
          ),
        ),
        onTap: () {
          _showDialog(context,image);
        },
      )
    ],
  );
}

void _showDialog(BuildContext context,XFile image) {
  AddPropertyController _addPropertyController =
  Get.find();

  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text(
          "REMOVE",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: "Semibold"),
        ),
        content: new Text(
          "Are you sure you want to remove?",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: "Regular"),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new TextButton(
            child: new Text(
              "Yes",
              style: TextStyle(
                  color: Colors.red, fontSize: 14, fontFamily: "Regular"),
            ),
            onPressed: () {
              _addPropertyController.image.remove(image);
              Navigator.of(context).pop();
            },
          ),
          new TextButton(
            child: new Text(
              "Cancel",
              style: TextStyle(
                  color: Colors.green, fontSize: 14, fontFamily: "Regular"),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
