import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/user_controller.dart';
import 'package:myyaowrealtorfltheme/backend/models/bannerModel.dart';
import 'package:myyaowrealtorfltheme/backend/models/user.dart';
import 'package:myyaowrealtorfltheme/backend/services/user_db.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/tab2.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/amenities.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/contact.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/gallery.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/map.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/overview.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/price.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/room.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/similar_properties.dart';

import '../../backend/models/propertyModel.dart';

class BannerDetail extends StatefulWidget {

  final BannerModel propertyModel;

  BannerDetail({
    @required this.propertyModel,
    Key key,
  }) : super(key: key);

  @override
  _BannerDetailState createState() => _BannerDetailState();
}

class _BannerDetailState extends State<BannerDetail>
    with SingleTickerProviderStateMixin {



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xFF265229),
          statusBarIconBrightness: Brightness.light),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: ListView(shrinkWrap: true, children: <Widget>[
            kHeader(context),
            kPrice(
                widget.propertyModel.des,widget.propertyModel.name),

            // SimilarProperties(),
          ]),
        ),
      ),
    );
  }

  Widget kHeader(BuildContext context) {
    return Container(
      color: Color(0xFF265229),
      height: 250,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[

          Image.network(
            widget.propertyModel.images,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),


          // Image.asset(
          //   'assets/images/home.jpg',
          //   width: double.infinity,
          //   height: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () => Get.back(),
              )),
        ],
      ),
    );
  }


}


Widget kPrice(String des,String name) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ), SizedBox(height: 10,),
        Text(
          name,
          style: TextStyle(
              color: Colors.black,

              fontSize: 18),
        ),
        SizedBox(height: 10,),
        Text(
          'Description',
          style: TextStyle(
              color: Colors.black,

              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        SizedBox(height: 10,),
        Text(
          ' ${des.toString()}',
          style: TextStyle(
              color: Colors.black,

              fontSize: 16),
        ),
      ],
    ),
  );
}
