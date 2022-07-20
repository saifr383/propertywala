import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/publics/home/feature/list.dart';
import 'package:shimmer/shimmer.dart';

import '../../../backend/models/bannerModel.dart';

class Feature extends StatelessWidget {
  List<BannerModel> list=[];
  Feature({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: FutureBuilder(
          future: _futureFunction(),
          builder: (context, snapshot) {

            List<Widget> l=[];
            if(snapshot.hasData)
            {
              for (int i = 0; i < list.length; i++) {
                l.add(ListViews(kFeatureData: list, index: i));
              }
              return CarouselSlider(
                options: CarouselOptions( autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  height: 229.0,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  aspectRatio: 2,
                  initialPage: 0,),
                items: l,
              );
            }
            return Container(width:Get.width,height: 200,child: SizedBox(width:30,height: 30,child: Center(child: CircularProgressIndicator())));



          }),
    );
  }
  Future<List<BannerModel>> _futureFunction() async{
    final QuerySnapshot<Map<String,dynamic>> collection = await FirebaseFirestore.instance.collection("Banner").get();
    print("collection length:"+collection.docs.length.toString());
    list = collection.docs.map( ( QueryDocumentSnapshot<Map> e) => BannerModel.fromMap(e.data(),e.id) ,).toList();
    print("list length is " + list.length.toString());
    return list;
  }
}
