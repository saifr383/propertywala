import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/main.dart';
import '../../../backend/models/propertyModel.dart';


class SinglePropertyAdReviewWidget extends StatefulWidget {

  final PropertyModel propertyModel;

  SinglePropertyAdReviewWidget( {Key key,  @required this.propertyModel}) : super(key: key);

  @override
  State<SinglePropertyAdReviewWidget> createState() => _SinglePropertyAdReviewWidgetState();
}

class _SinglePropertyAdReviewWidgetState extends State<SinglePropertyAdReviewWidget> {
  // UserController _usercontroller=Get.find();

  bool loading = false;
  bool removed = false;

  @override
  Widget build(BuildContext context) {

    return

    removed ? SizedBox(height: 0,) :
      loading ? SizedBox(
        height: 300,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) :
      InkWell(
      onTap: () {
        Get.to(() => PropertyDetail(
          propertyModel: widget.propertyModel,
        ));
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: SizedBox(width: Get.width,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.only(
                    topRight: const Radius.circular(5),
                    topLeft: const Radius.circular(5)),
                child: Image.network(
                  widget.propertyModel.images[0],
                  height: 150.0,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        widget.propertyModel.price + " Rs",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Semibold',
                            fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2, left: 10, bottom: 10),
                      child: Text(
                        '' + widget.propertyModel.address,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Regular'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                MaterialCommunityIcons.bed_empty,
                                color: Colors.grey[500],
                                size: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  ( widget.propertyModel.bedroom+1).toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Semibold'),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                MaterialCommunityIcons.bed_empty,
                                color: Colors.grey[500],
                                size: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  (widget.propertyModel.bathroom+1).toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Semibold'),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                MaterialCommunityIcons.square,
                                color: Colors.grey[500],
                                size: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  '' + widget.propertyModel.area,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Semibold'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    buttons(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> removeAndAccept() async{
    try {
      await FirebaseFirestore.instance.collection("Area").doc(widget.propertyModel.uid).update({
        "status" : "accept"
      });
      return true;
    }
    catch(e){
      Get.snackbar("Error", e.toString());
      return false;
    }

  }

  Future<bool> removeAndReject() async{
    try {
      await FirebaseFirestore.instance.collection("Area").doc(widget.propertyModel.uid).update({
        "status" : "reject"
      });
      return true;
    }
    catch(e){
      Get.snackbar("Error", e.toString());
      return false;
    }
  }

  buttons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(title: "Accept", color: Colors.green, icon: Icons.check,
          onTap: () async{
            setState(() {
              loading = true;
              removed = false;
            });
            bool status = await removeAndAccept();
            if(status){
              setState(() {
                loading = false;
                removed = true;
              });
              Get.snackbar("Success", "Property ad accepted",snackPosition: SnackPosition.BOTTOM);
            }
            else{
              setState(() {
                loading = false;
                removed = false;
              });
            }
          },
        ),
        SizedBox(width: 30,),
        CustomButton(title: "Reject", color: Colors.redAccent, icon: Icons.clear,
            onTap: () async{
              setState(() {
                loading = true;
                removed = false;
              });
              bool status = await removeAndReject();
              if(status){
                setState(() {
                  loading = false;
                  removed = true;
                });
                Get.snackbar("Success", "Property ad rejected",snackPosition: SnackPosition.BOTTOM);
              }
              else{
                setState(() {
                  loading = false;
                  removed = false;
                });
              }
            }
        )
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  Color color;
  IconData icon;
  Function onTap;
  CustomButton({Key key,@required this.title, @required this.color, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color,
              borderRadius: new BorderRadius.all(
                  new Radius.circular(5))),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: "Semibold"),
              ),
              Icon(
                icon ??
                Icons.keyboard_arrow_right,
                size: 25,
                color: Colors.black,
              )
            ],
          )),
    );
  }
}

