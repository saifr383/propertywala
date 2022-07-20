import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/publics/home/admin/single_property_review_widget.dart';
import 'package:myyaowrealtorfltheme/publics/property/list.dart';
import '../../../backend/models/propertyModel.dart';

class PendingPropertiesAdmin extends StatelessWidget {


  PendingPropertiesAdmin({Key key}) : super(key: key);

  List<PropertyModel> list;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF265229),
          title: Text(
            'Pending Properties Ads',
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
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: SinglePropertyAdReviewWidget(propertyModel: list[index]),
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


  Future<List<PropertyModel>> _futureFunction() async{
    final QuerySnapshot<Map<String,dynamic>> collection = await FirebaseFirestore.instance.collection("Area").where('status',isEqualTo: 'pending').get();
    print("collection length:"+collection.docs.length.toString());
    list = collection.docs.map( ( QueryDocumentSnapshot<Map> e) => PropertyModel.fromMap(e.data(),e.id) ,).toList();
    print("list length is " + list.length.toString());
    return list;
  }
}
