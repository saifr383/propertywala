import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../backend/controllers/addproperty_controller.dart';

Widget kLocation(BuildContext context,bool area) {
  AddPropertyController _addPropertyController=Get.put(AddPropertyController());
  List<String> _country = ["Select","DHA Lahore", "DHA Multan",'DHA Bahawalpur','DHA Gujranwala','DHA Quetta','DHA Islamabad','DHA Karachi','DHA Peshawar','Others'];
  return Container(
    margin: EdgeInsets.all(20),
    child:
        ListView(shrinkWrap: false, scrollDirection: Axis.vertical, children: <
            Widget>[
      Text(
        'Address',
        style:
            TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Regular"),
      ),
      Container(
        margin: EdgeInsets.only(top: 10, bottom: 30),
        padding: EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 10),
        decoration: new BoxDecoration(
            color: Colors.grey[200],
            borderRadius: new BorderRadius.all(new Radius.circular(5))),
        child: Row(
          children: <Widget>[
            new Flexible(
              child: Form(
                key: _addPropertyController.formKeyPage2,
                child: TextFormField(
                    validator: (value){if(value==null||value.isEmpty||value=="")
                      return "Field is empty";
                    return null;},
                    controller: _addPropertyController.addressController,
                    style: TextStyle(
                        color: Colors.black, fontSize: 12, fontFamily: "Regular"),
                    cursorColor: Colors.black,
                    decoration: new InputDecoration.collapsed(
                      hintText: 'e.g. 3-277-10, 1st Street ',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: "Regular"),
                    )),
              ),
            ),
          ],
        ),
      ),
          Text(
            'Near By Address',
            style:
            TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Regular"),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 30),
            padding: EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 10),
            decoration: new BoxDecoration(
                color: Colors.grey[200],
                borderRadius: new BorderRadius.all(new Radius.circular(5))),
            child: Row(
              children: <Widget>[
                new Flexible(
                  child: Form(

                    child: TextFormField(
                        validator: (value){if(value==null||value.isEmpty||value=="")
                          return "Field is empty";
                        return null;},
                        controller: _addPropertyController.nearController,
                        style: TextStyle(
                            color: Colors.black, fontSize: 12, fontFamily: "Regular"),
                        cursorColor: Colors.black,
                        decoration: new InputDecoration.collapsed(
                          hintText: '1st Street ',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: "Regular"),
                        )),
                  ),
                ),
              ],
            ),
          ),
      // Text(
      //   'City',
      //   style:
      //       TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Regular"),
      // ),
      // Container(
      //   margin: EdgeInsets.only(top: 10, bottom: 30),
      //   padding: EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 10),
      //   decoration: new BoxDecoration(
      //       color: Colors.grey[200],
      //       borderRadius: new BorderRadius.all(new Radius.circular(5))),
      //   child: Row(
      //     children: <Widget>[
      //       new Flexible(
      //         child: TextField(
      //             style: TextStyle(
      //                 color: Colors.black, fontSize: 12, fontFamily: "Regular"),
      //             cursorColor: Colors.black,
      //             decoration: new InputDecoration.collapsed(
      //               hintText: 'e.g. Streatham',
      //               hintStyle: TextStyle(
      //                   color: Colors.grey,
      //                   fontSize: 12,
      //                   fontFamily: "Regular"),
      //             )),
      //       ),
      //     ],
      //   ),
      // ),
      // Text(
      //   'State',
      //   style:
      //       TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Regular"),
      // ),
      // Container(
      //   margin: EdgeInsets.only(top: 10, bottom: 30),
      //   padding: EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 10),
      //   decoration: new BoxDecoration(
      //       color: Colors.grey[200],
      //       borderRadius: new BorderRadius.all(new Radius.circular(5))),
      //   child: Row(
      //     children: <Widget>[
      //       new Flexible(
      //         child: TextField(
      //             style: TextStyle(
      //                 color: Colors.black, fontSize: 12, fontFamily: "Regular"),
      //             cursorColor: Colors.black,
      //             decoration: new InputDecoration.collapsed(
      //               hintText: 'e.g.London',
      //               hintStyle: TextStyle(
      //                   color: Colors.grey,
      //                   fontSize: 12,
      //                   fontFamily: "Regular"),
      //             )),
      //       ),
      //     ],
      //   ),
      // ),
      // Text(
      //   'Postcode',
      //   style:
      //       TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Regular"),
      // ),
      // Container(
      //   margin: EdgeInsets.only(top: 10, bottom: 30),
      //   padding: EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 10),
      //   decoration: new BoxDecoration(
      //       color: Colors.grey[200],
      //       borderRadius: new BorderRadius.all(new Radius.circular(5))),
      //   child: Row(
      //     children: <Widget>[
      //       new Flexible(
      //         child: TextField(
      //           style: TextStyle(
      //               color: Colors.black, fontSize: 12, fontFamily: "Regular"),
      //           cursorColor: Colors.black,
      //           decoration: new InputDecoration.collapsed(
      //             hintText: 'e.g. SW16',
      //             hintStyle: TextStyle(
      //                 color: Colors.grey, fontSize: 12, fontFamily: "Regular"),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
     area? Text(
        'Area',
        style:
            TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Regular"),
      ):SizedBox(),
      area?Container(
        margin: EdgeInsets.only(top: 10, bottom: 20),
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Obx(
            ()=> DropdownButtonHideUnderline(
            child: DropdownButton(
              items: _country
                  .map((value) => DropdownMenuItem(
                        child: Text(
                          value,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: "Regular"),
                        ),
                        value: value,
                      ))
                  .toList(),
              onChanged: (String value) {
                _addPropertyController.dhaArea.value=value;

              },
              isExpanded: false,
              value: _addPropertyController.dhaArea.value,
            ),
          ),
        ),
      ):SizedBox(),
    ]),
  );
}
