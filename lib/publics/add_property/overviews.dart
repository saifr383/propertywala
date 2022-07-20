import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/addproperty_controller.dart';

class Overviews extends StatefulWidget {
  @override
  OverviewsState createState() => OverviewsState();
}

class OverviewsState extends State<Overviews> {
  AddPropertyController _addPropertyController =
      Get.put(AddPropertyController());
  List<Color> color1 = [
    Color(0xFF265229),
    Colors.grey[200],
    Colors.grey[200],
    Colors.grey[200],
    Colors.grey[200],
    Colors.grey[200]
  ];
  List<Color> color2 = [
    Color(0xFF265229),
    Colors.grey[200],
    Colors.grey[200],
    Colors.grey[200],
    Colors.grey[200],
    Colors.grey[200]
  ];

  List<String> _type = ['Select', "Residential", "Commercial"];
  List<String> _rtype = ['Select', "Plot", "House", 'Appartment'];
  List<String> _ctype = ["Select", "Plot", "Office", 'ShowRoom'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Form(key: _addPropertyController.formKeyPage1,
              child: Column(
                children: [
                  Text(
                    'Property Name',
                    style: TextStyle(
                        color: Colors.black, fontSize: 12, fontFamily: "Regular"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 30),
                    padding:
                        EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 10),
                    decoration: new BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: new BorderRadius.all(new Radius.circular(5))),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "")
                          return "Field is empty";
                        return null;
                      },
                      controller: _addPropertyController.nameController,
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'Regular', fontSize: 12),
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
                    'Property Type',
                    style: TextStyle(
                        color: Colors.black, fontSize: 12, fontFamily: "Regular"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 30),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: _type
                            .map((value) => DropdownMenuItem(
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                        fontFamily: "Regular"),
                                  ),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (String value) {
                          _addPropertyController.propertyType = value;

                          setState(() {});
                        },
                        isExpanded: false,
                        value: _addPropertyController.propertyType,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  _addPropertyController.propertyType == 'Residential'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Property SubType',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "Regular"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 30),
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              width: Get.width,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: _rtype
                                      .map((value) => DropdownMenuItem(
                                            child: Row(
                                              children: [
                                                Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                      fontFamily: "Regular"),
                                                )
                                              ],
                                            ),
                                            value: value,
                                          ))
                                      .toList(),
                                  onChanged: (String value) {
                                    _addPropertyController.propertySubType = value;
                                    setState(() {});
                                  },
                                  isExpanded: false,
                                  value: _addPropertyController.propertySubType,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  _addPropertyController.propertyType == 'Commercial'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Property SubType',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "Regular"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 30),
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              width: Get.width,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: _ctype
                                      .map((value) => DropdownMenuItem(
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                  fontFamily: "Regular"),
                                            ),
                                            value: value,
                                          ))
                                      .toList(),
                                  onChanged: (String value) {
                                    _addPropertyController.propertySubType = value;
                                    setState(() {});
                                  },
                                  isExpanded: false,
                                  value: _addPropertyController.propertySubType,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.black, fontSize: 12, fontFamily: "Regular"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 30),
                    padding:
                        EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 10),
                    decoration: new BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: new BorderRadius.all(new Radius.circular(5))),
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
                  _addPropertyController.propertyType == 'Residential'?
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Bedroom',
                      style: TextStyle(
                          color: Colors.black, fontSize: 12, fontFamily: "Regular"),
                    ),
                  ):SizedBox(),
                  _addPropertyController.propertyType == 'Residential'?
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click(0);
                            },
                            child: kMenus("0", color1[0])),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click(1);
                            },
                            child: kMenus("1", color1[1])),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click(2);
                            },
                            child: kMenus("2", color1[2])),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click(3);
                            },
                            child: kMenus("3", color1[3])),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click(4);
                            },
                            child: kMenus("4+", color1[4])),
                      ),
                    ],
                  ):SizedBox(),
                  _addPropertyController.propertyType == 'Residential'?
                  Container(
                    margin: EdgeInsets.only(bottom: 5, top: 20),
                    child: Text(
                      'Bathroom',
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontFamily: "Regular"),
                    ),
                  ):SizedBox(),
                  _addPropertyController.propertyType == 'Residential'?
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click2(0);
                            },
                            child: kMenus("0", color2[0])),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click2(1);
                            },
                            child: kMenus("1", color2[1])),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click2(2);
                            },
                            child: kMenus("2", color2[2])),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click2(3);
                            },
                            child: kMenus("3", color2[3])),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click2(4);
                            },
                            child: kMenus("4+", color2[4])),
                      ),
                    ],
                  ):SizedBox(),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Price',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "Regular"),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: 20, top: 20, bottom: 20, left: 10),
                                margin: EdgeInsets.only(top: 10),
                                decoration: new BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius:
                                        new BorderRadius.all(new Radius.circular(5))),
                                child: Row(
                                  children: <Widget>[
                                    new Flexible(
                                      child: TextFormField(keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                value == "")
                                              return "Field is empty";
                                            return null;
                                          },
                                          controller: _addPropertyController
                                              .priceController,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Regular",
                                              color: Colors.black),
                                          cursorColor: Colors.black,
                                          decoration: new InputDecoration.collapsed(
                                            hintText: 'e.g. 10000',
                                            hintStyle: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "Regular",
                                                color: Colors.grey),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Area(Marla)',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Regular",
                                    color: Colors.black),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: 20, top: 20, bottom: 20, left: 10),
                                margin: EdgeInsets.only(top: 10),
                                decoration: new BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(5))),
                                child: Row(
                                  children: <Widget>[
                                    new Flexible(
                                      child: TextFormField(

                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                value == "")
                                              return "Field is empty";
                                            return null;
                                          },keyboardType: TextInputType.number,
                                          controller:
                                              _addPropertyController.areaController,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Regular",
                                              color: Colors.black),
                                          cursorColor: Colors.black,
                                          decoration: new InputDecoration.collapsed(
                                            hintText: 'e.g. 4200',
                                            hintStyle: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "Regular",
                                                color: Colors.grey),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Widget kMenus(String text, Color color) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
      decoration: new BoxDecoration(
        color: Colors.grey[200],
        borderRadius: new BorderRadius.all(new Radius.circular(5)),
        border: Border.all(color: color, width: 4),
      ),
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Text(
        text,
        style:
            TextStyle(color: Colors.black, fontSize: 14, fontFamily: "Regular"),
      ),
    );
  }

  void click(int i) {
    _addPropertyController.bedroom = i;
    setState(() {
      if (color1[i] == Color(0xFF265229)) {
        color1[i] = Colors.grey[200];
      } else {
        color1[i] = Color(0xFF265229);
      }
      for (int j = 0; j < color1.length; j++) {
        if (j != i) {
          color1[j] = Colors.grey[200];
        }
      }
    });
  }

  void click2(int i) {
    _addPropertyController.bathroom = i;
    setState(() {
      if (color2[i] == Color(0xFF265229)) {
        color2[i] = Colors.grey[200];
      } else {
        color2[i] = Color(0xFF265229);
      }
      for (int j = 0; j < color2.length; j++) {
        if (j != i) {
          color2[j] = Colors.grey[200];
        }
      }
    });
  }
}
