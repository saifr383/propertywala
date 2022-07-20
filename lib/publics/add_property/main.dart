import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/user_controller.dart';
import 'package:myyaowrealtorfltheme/backend/services/user_db.dart';
import 'package:myyaowrealtorfltheme/publics/add_property/location.dart';
import 'package:myyaowrealtorfltheme/publics/add_property/overviews.dart';
import 'package:myyaowrealtorfltheme/publics/add_property/photo.dart';
import '../../backend/controllers/addproperty_controller.dart';
import '../../backend/models/propertyModel.dart';

class AddProperties extends StatefulWidget {
  bool area;
  AddProperties({Key key, this.title,this.area=false}) : super(key: key);
  final String title;

  @override
  _AgentState createState() => _AgentState();
}

class _AgentState extends State<AddProperties>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AddPropertyController>(
        init: AddPropertyController(),
        builder: (_addPropertyController) {
          return ModalProgressHUD(
            inAsyncCall: _addPropertyController.loading.value,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                  // resizeToAvoidBottomPadding: false,
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Color(0xFF265229),
                    title: Text(
                      'CREATE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Semibold',
                        fontSize: 14,
                      ),
                    ),
                    elevation: 0.0,
                    centerTitle: true,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () => Navigator.pop(context, false),
                    ),
                    bottom: TabBar(
                      controller: _tabController,
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.black,
                      isScrollable: false,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.white,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Semibold',
                          fontSize: 11),
                      unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Regular',
                          fontSize: 11),
                      indicator: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0))),
                      ),
                      tabs: [
                        new Tab(
                          child: Text(
                            'Overview',
                          ),
                        ),
                        new Tab(
                          child: Text(
                            'Location',
                          ),
                        ),
                        new Tab(
                          child: Text(
                            'Photo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            Overviews(),
                            kLocation(context,widget.area),
                            kPhoto(context),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Row(children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: InkWell(
                                  onTap: () {
                                    if (_tabController.index == 0) {
                                    } else {
                                      _tabController.animateTo(
                                          (_tabController.index - 1) % 4);
                                    }
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(5))),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.keyboard_arrow_left,
                                            size: 25,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            'PREVIOUS',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontFamily: "Semibold"),
                                          ),
                                        ],
                                      )))),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                                onTap: () async {
                                  UserController userController = Get.find();
                                  if (_tabController.index == 2) {

                                      _addPropertyController.loading.value =
                                          true;
                                      List<String> uploadedimage =
                                          await _addPropertyController
                                              .uploadFiles(
                                                  _addPropertyController
                                                      .image.value);
                                      UserDatabase.uploadAdd(
                                          PropertyModel(
                                          _addPropertyController
                                              .nameController.text,
                                          _addPropertyController.propertyType,
                                          _addPropertyController
                                              .propertySubType,
                                          _addPropertyController
                                              .desController.text,
                                          _addPropertyController.bedroom,
                                          _addPropertyController.bathroom,
                                          _addPropertyController
                                              .priceController.text,
                                          _addPropertyController
                                              .areaController.text,
                                          _addPropertyController
                                              .addressController.text,
                                          _addPropertyController.dhaArea.value,
                                          uploadedimage,
                                        userController.userModel.id,
                                          'pending')
                                      );
                                      // _addPropertyController.loading.value=false;
                                      print(
                                          '/////////////////////////////////////////////////');

                                      Get.back();

                                  } else if (_tabController.index == 0) {
                                    if (_addPropertyController.propertyType ==
                                        'Select') {
                                      Get.snackbar("Error",
                                          'Please Select some property type');
                                    } else if (_addPropertyController
                                            .propertySubType ==
                                        'Select') {
                                      Get.snackbar("Error",
                                          'Please Select some property type');
                                    } else if (_addPropertyController
                                        .formKeyPage1.currentState
                                        .validate())
                                      _tabController.animateTo(
                                          (_tabController.index + 1) % 4);
                                  } else if (_tabController.index == 1) {
                                    if (_addPropertyController.dhaArea.value ==
                                        'Select') {
                                      Get.snackbar(
                                          "Error", 'Please Select some Area');
                                    } else if (_addPropertyController
                                        .formKeyPage2.currentState
                                        .validate())
                                      _tabController.animateTo(
                                          (_tabController.index + 1) % 4);
                                  }
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFCC300),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(5))),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'NEXT',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: "Semibold"),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          size: 25,
                                          color: Colors.black,
                                        )
                                      ],
                                    ))),
                          )
                        ]),
                      ),
                    ],
                  )),
            ),
          );
        });
  }
}
