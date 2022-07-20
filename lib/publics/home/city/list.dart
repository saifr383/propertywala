import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/publics/property/main.dart';

import '../../othersearch.dart';

class SingleCityWidget extends StatelessWidget {
  final String propertyType;
  SingleCityWidget(this.propertyType,{Key key, @required this.image, @required this.location})
      : super(key: key);
  final String image;
  final String location;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(propertyType=='Others')
          Get.to(OtherSearch());
else
        Get.to(Property(propertyType));
      },
      child: Column(

        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: new BorderRadius.all(const Radius.circular(5)),
              child: Image.asset(
                 image,
                height: 100.0,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),

          Text(
            '' + location,
            style: TextStyle(
                color: Colors.black,
                fontSize: 12),
          )
        ],
      ),
    );
  }
}
