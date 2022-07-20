import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/user_controller.dart';
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

class PropertyDetail extends StatefulWidget {
  final PropertyModel propertyModel;

  PropertyDetail({
    @required this.propertyModel,
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  _PropertyDetailState createState() => _PropertyDetailState();
}

class _PropertyDetailState extends State<PropertyDetail>
    with SingleTickerProviderStateMixin {
  List data;
  bool inf = true;
  bool eng = false;
  TabController _tabController;
  GoogleMapController _controller;
  List<Location> address = [
    Location(latitude: 37.42796133580664, longitude: -122.085749655962)
  ];

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

// // 2
//   static final CameraPosition _myLocation = CameraPosition(
//     target: LatLng(0, 0),
//   );

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          inf = true;
          eng = false;
        } else {
          inf = false;
          eng = true;
        }
      });
    });
    mapFunction();
  }

  ///uploaded by
  UserModel userModel;

  futureFunction() async {
    userModel = await UserDatabase().getUser(widget.propertyModel.userId);
    return userModel;
  }

  mapFunction() async {
   address = await locationFromAddress(widget.propertyModel.address);
   setState(() {

   });
  }

  // UserController userController = Get.find();

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
          body: FutureBuilder(
              future: futureFunction(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView(shrinkWrap: true, children: <Widget>[
                    kHeader(context),
                    kPrice(
                        widget.propertyModel.price,
                        widget.propertyModel.address,
                        widget.propertyModel.name),
                    kRooms(widget.propertyModel),
                    kOverView(widget.propertyModel),
                    InkWell(
                      child: kGallery(context, widget.propertyModel.images),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((BuildContext context) {
                              return DynamicDialog(
                                context: context,
                                propertyModel: widget.propertyModel,
                              );
                            }));
                      },
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(left: 15, top: 30),
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     'Amenities',
                    //     textAlign: TextAlign.left,
                    //     style: TextStyle(
                    //         color: Colors.black, fontSize: 14, fontFamily: "Semibold"),
                    //   ),
                    // ),
                    // Container(
                    //     height: 100,
                    //     padding: EdgeInsets.only(
                    //         left: 20, right: 20, bottom: 30, top: 10),
                    //     child: kAmenities()),
                    Container(
                      color: Colors.grey[300],
                      padding: EdgeInsets.only(top: 30),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            padding:
                                EdgeInsets.only(left: 15, top: 5, bottom: 15),
                            child: Text(
                              'Location',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "Semibold"),
                            ),
                          ),
                          Container(
                            height: 220,
                            child: GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition: _kGooglePlex,
                              onMapCreated: (GoogleMapController controller) {
                                print("TEST LOADED");
                                _controller = controller;
                                _controller.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            target: LatLng(address[0].latitude,
                                                address[0].longitude),
                                            zoom: 15)));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    kContact(context, userModel),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Column(
                        children: [
                          Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                            endIndent: 20,
                            indent: 20,
                          ),
                          Text(
                            "Informations",
                            style:
                                TextStyle(fontFamily: 'Semibold', fontSize: 18),
                          ),
                          Divider(
                            indent: 20,
                            endIndent: 20,
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                          Tab2(userModel)
                        ],
                      ),
                    ),
                    // Visibility(
                    //   child: Container(
                    //     child: Tab2(userModel),
                    //   ),
                    //   visible: inf,
                    // ),
                    Visibility(
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: Container(),
                      ),
                      visible: eng,
                    ),
                    // SimilarProperties(),
                  ]);
                }
              }),
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
            widget.propertyModel.images[0],
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
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () => Get.back(),
              )),
        ],
      ),
    );
  }
}

Widget kEnquire(BuildContext context, UserModel userModel) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: new BorderRadius.all(new Radius.circular(5))),
              child: TextField(
                style: TextStyle(
                    fontFamily: 'Regular', color: Colors.grey, fontSize: 12),
                cursorColor: Colors.black,
                decoration: new InputDecoration.collapsed(
                  hintText: 'First Name',
                  hintStyle: TextStyle(
                      fontFamily: 'Regular', color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: new BorderRadius.all(new Radius.circular(5))),
              child: TextField(
                  style: TextStyle(
                      fontFamily: 'Regular', color: Colors.grey, fontSize: 12),
                  cursorColor: Colors.black,
                  decoration: new InputDecoration.collapsed(
                    hintText: 'Last Name',
                    hintStyle: TextStyle(
                        fontFamily: 'Regular',
                        color: Colors.grey,
                        fontSize: 12),
                  )),
            ),
          )
        ],
      ),
      Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(5),
        decoration: new BoxDecoration(
            color: Colors.grey[200],
            borderRadius: new BorderRadius.all(new Radius.circular(5))),
        child: TextField(
            style: TextStyle(
                fontFamily: 'Regular', color: Colors.grey, fontSize: 12),
            cursorColor: Colors.black,
            decoration: new InputDecoration.collapsed(
              hintText: 'Your Email Address',
              hintStyle: TextStyle(
                  fontFamily: 'Regular', color: Colors.grey, fontSize: 12),
            )),
      ),
      Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(5),
        decoration: new BoxDecoration(
            color: Colors.grey[200],
            borderRadius: new BorderRadius.all(new Radius.circular(5))),
        child: TextField(
            style: TextStyle(
                fontFamily: 'Regular', color: Colors.grey, fontSize: 12),
            cursorColor: Colors.black,
            decoration: new InputDecoration.collapsed(
              hintText: 'Your Mobile No',
              hintStyle: TextStyle(
                  fontFamily: 'Regular', color: Colors.grey, fontSize: 12),
            )),
      ),
      Container(
        height: 120,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(5),
        decoration: new BoxDecoration(
            color: Colors.grey[200],
            borderRadius: new BorderRadius.all(new Radius.circular(5))),
        child: TextField(
            style: TextStyle(
                fontFamily: 'Regular', color: Colors.grey, fontSize: 12),
            cursorColor: Colors.black,
            decoration: new InputDecoration.collapsed(
              hintText: 'Your Message',
              hintStyle: TextStyle(
                  fontFamily: 'Regular', color: Colors.grey, fontSize: 12),
            )),
      ),
      Container(
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor: MaterialStateProperty.all(
              Color(0xFFFCC300),
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                color: Colors.black,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          onPressed: () {
            showGeneralDialog(
                barrierColor: Colors.black.withOpacity(0.5),
                transitionBuilder: (context, a1, a2, widget) {
                  return kSuccessDialog(context);
                },
                transitionDuration: Duration(milliseconds: 200),
                // DURATION FOR ANIMATION
                barrierDismissible: true,
                barrierLabel: 'LABEL',
                context: context,
                pageBuilder: (context, animation1, animation2) {
                  return Text('PAGE BUILDER');
                });
          },
          child: new Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  'SEND',
                  style: TextStyle(
                      fontFamily: 'Semibold',
                      color: Colors.black,
                      fontSize: 12),
                ),
              ),
              Icon(
                Icons.mail,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

class DynamicDialog extends StatefulWidget {
  final PropertyModel propertyModel;

  DynamicDialog({this.context, @required this.propertyModel});

  final BuildContext context;

  @override
  _DynamicDialogState createState() => _DynamicDialogState();
}

class _DynamicDialogState extends State<DynamicDialog> {
  List<String> _image;

  // List<String> _image = [
  //   'assets/images/home.jpg',
  //   'assets/images/gallery1.jpg',
  //   'assets/images/gallery2.jpg',
  //   'assets/images/gallery3.jpg',
  //   'assets/images/gallery4.jpg',
  //   'assets/images/gallery1.jpg',
  // ];
  int pos = 0;

  @override
  Widget build(BuildContext context) {
    _image = widget.propertyModel.images;

    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  new Text(
                    "CLOSE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Regular"),
                  ),
                ],
              ),
              onPressed: () => Navigator.of(context).pop()),
          Image.network(
            _image[pos],
            height: 400,
            width: MediaQuery.of(context).size.width / 0.5,
            fit: BoxFit.cover,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      new Text(
                        "PREVIEW",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Regular"),
                      ),
                    ],
                  ),
                  onPressed: () {
                    if (pos > 0) {
                      setState(() {
                        pos = pos - 1;
                      });
                    }
                  },
                ),
              ),
              Container(
                width: 30,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Row(
                    children: <Widget>[
                      new Text(
                        "NEXT",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Regular"),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    if (pos < _image.length - 1) {
                      setState(() {
                        pos = pos + 1;
                      });
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget kSuccessDialog(BuildContext context) {
  return Material(
      type: MaterialType.transparency,
      child: Center(
          child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: new BorderRadius.circular(5.0)),
        margin: EdgeInsets.all(20),
        height: 280,
        width: MediaQuery.of(context).size.width / 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/tick.png',
              height: 80,
              width: 80,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'SENT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Semibold',
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Your mail has been sent',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Regular',
                  fontSize: 12,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context, false);
              },
              child: Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Color(0xFFFCC300),
                    borderRadius: new BorderRadius.circular(5.0)),
                child: Text(
                  'OKAY',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontFamily: "Regular"),
                ),
              ),
            )
          ],
        ),
      )));
}
