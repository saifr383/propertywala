import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/publics/home/admin/single_property_review_widget.dart';
import 'package:myyaowrealtorfltheme/publics/property/list.dart';
import '../../../backend/models/bannerModel.dart';
import '../../../backend/models/propertyModel.dart';
import '../../bannerdetal.dart';

class currentbanner extends StatelessWidget {


  currentbanner({Key key}) : super(key: key);

  List<BannerModel> list;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),onPressed: (){Get.back();},),
          backgroundColor: Color(0xFF265229),
          title: Text(
            'Current Banner',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Semibold',
              fontSize: 14,
            ),
          ),

          elevation: 0.0,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: FutureBuilder(
                  future: _futureFunction(),
                  // future: DefaultAssetBundle.of(context).loadString('assets/json/feature.json'),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    else {
                      // var kFeatureData = json.decode(snapshot.data.toString());
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){Get.to(BannerDetail(propertyModel: list[index]));},
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.all(const Radius.circular(5)),
                                    child: Image.network(
                                      '' + list[index].images,
                                      width: 180.0,
                                      height: 90.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 10, bottom: 5),
                                            child: Text(
                                              '' + list[index].name,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Regular"),
                                            ),
                                          ),

                                        ],
                                      )),
                                  InkWell(
                                      onTap: () {
                                        _showDialog(context,list[index].uid);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          MaterialCommunityIcons.delete_forever_outline,
                                          color: Colors.grey[500],
                                          size: 25,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: list.length,
                      );
                    }
                  }
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 2,
            ),
          ],
        ));
  }


  Future<List<BannerModel>> _futureFunction() async{
    final QuerySnapshot<Map<String,dynamic>> collection = await FirebaseFirestore.instance.collection("Banner").get();
    print("collection length:"+collection.docs.length.toString());
    list = collection.docs.map( ( QueryDocumentSnapshot<Map> e) => BannerModel.fromMap(e.data(),e.id) ,).toList();
    print("list length is " + list.length.toString());
    return list;
  }
}
void _showDialog(BuildContext context,String id) {
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
              FirebaseFirestore.instance.collection("Banner").doc(id).delete();
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
