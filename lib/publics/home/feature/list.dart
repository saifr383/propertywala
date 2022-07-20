import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/backend/models/bannerModel.dart';
import 'package:myyaowrealtorfltheme/publics/bannerdetal.dart';

class ListViews extends StatelessWidget {
  ListViews({Key key, @required this.kFeatureData, @required this.index})
      : super(key: key);
  final List<BannerModel> kFeatureData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Get.to(BannerDetail(propertyModel: kFeatureData[index]));},
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: new BorderRadius.all(
                 const Radius.circular(5),
                  ),
              child: Image.network(
                '' + kFeatureData[index].images,
height: 219,
                width: MediaQuery.of(context).size.width / 1.4,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
