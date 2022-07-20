import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/addproperty_controller.dart';
import 'package:myyaowrealtorfltheme/publics/add_property/main.dart';
import 'package:myyaowrealtorfltheme/publics/notlogin/notlogin.dart';
import 'package:myyaowrealtorfltheme/publics/property/list.dart';
import '../../backend/controllers/auth_controller.dart';
import '../../backend/controllers/filter_controller.dart';
import '../../backend/models/propertyModel.dart';

class Property extends StatefulWidget {


  final String propertyType;
  String search='';
  Property(this.propertyType,{Key key, this.title,this.search=''}) : super(key: key);
  final String title;

  @override
  _PropertyState createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
 FilterController _filterController=Get.put(FilterController());
 User user = Get.find<AuthController>().user;

  List<PropertyModel> list;

  bool value1 = false;
  bool value2 = false;
  bool ascendingsort=false;
  bool decendingsort=false;
  int checkvalue=-1;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
    if(widget.propertyType=='')
    {
        Get.defaultDialog(title: 'Filter', content: Column(children: [
          widget.propertyType != '' ? SizedBox() : Text(
            'Cities',
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontFamily: "Regular"),
          ),
          widget.propertyType != '' ? SizedBox() : Container(
            margin: EdgeInsets.only(top: 10, bottom: 30),
            padding: EdgeInsets.only(left: 10, right: 10),
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Obx(
                  () =>
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: _filterController.country
                          .map((value) =>
                          DropdownMenuItem(
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
                      onChanged: (value) {
                        _filterController.selectedcity.value = value;
                      },
                      isExpanded: false,
                      value: _filterController.selectedcity.value,
                    ),
                  ),
            ),
          ),
          SizedBox(
            height: 6,
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
            child: Obx(
                  () =>
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: _filterController.type
                          .map((value) =>
                          DropdownMenuItem(
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
                      onChanged: (value) {
                        _filterController.propertytype.value = value;
                        if (value == 'Residential') {
                          _filterController.subpropertytype.value = 'All';
                          _filterController.subtype.value =
                              _filterController.rtype;
                        } else if (value == 'Commercial') {
                          _filterController.subpropertytype.value = 'All';
                          _filterController.subtype.value =
                              _filterController.ctype;
                        } else {
                          _filterController.subpropertytype.value = 'All';
                          _filterController.subtype.value = [
                            'All'
                          ];
                        }
                      },
                      isExpanded: false,
                      value: _filterController.propertytype.value,
                    ),
                  ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            'SubProperty Type',
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
            child: Obx(
                  () =>
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: _filterController.subtype.value
                          .map((value) =>
                          DropdownMenuItem(
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
                      onChanged: (value) {
                        _filterController.subpropertytype.value = value;
                      },
                      isExpanded: false,
                      value: _filterController.subpropertytype.value,
                    ),
                  ),
            ),
          ),
          ElevatedButton(onPressed: () {
            setState(() {

            });
            Get.back();
          }, child: Text('save'))
        ],));
  }});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.search);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF265229),
          title: Text(
            'PROPERTIES',
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Padding(padding: EdgeInsets.only(bottom: 40),
          child: FloatingActionButton(child: Icon(Icons.add,color: Colors.white,),onPressed: () async {
            if(user!=null) {
              if(widget.propertyType!=''){

                AddPropertyController _controller =
                    Get.put(AddPropertyController());
                _controller.dhaArea.value = widget.propertyType;
                Get.to(() => AddProperties());}
else
                Get.to(() => AddProperties(area: true,));
              }
            else{
              Get.to(() => NotLoggedInScreen(size: true,));
            }
            },),
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

                          print(widget.search);
                          if(list[index]!=null&&list[index].address.toLowerCase().contains(widget.search.toLowerCase()))

                          return Container(
                            margin: EdgeInsets.all(10),
                            child: SinglePropertyAdWidget(propertyModel: list[index]),
                          );
                          else return SizedBox();
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
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        _settingModalBottomSheet(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            MaterialCommunityIcons.sort,
                            color: Colors.grey[500],
                            size: 20,
                          ),
                          Text(
                            ' SORT BY',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: "Regular",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.defaultDialog(title: 'Filter',content: Column(children: [
                          widget.propertyType!=''?SizedBox():Text(
                            'Cities',
                            style: TextStyle(
                                color: Colors.black, fontSize: 12, fontFamily: "Regular"),
                          ),
                          widget.propertyType!=''?SizedBox():Container(
                            margin: EdgeInsets.only(top: 10, bottom: 30),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Obx(
                                  ()=> DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: _filterController.country
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
                                  onChanged: (value) {

                                    _filterController.selectedcity.value=value;

                                  },
                                  isExpanded: false,
                                  value: _filterController.selectedcity.value,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6,
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
                            child: Obx(
                                ()=> DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: _filterController.type
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
                                  onChanged: (value) {

                                     _filterController.propertytype.value=value;
                                     if(value=='Residential') {
                                       _filterController.subpropertytype.value='All';
                                            _filterController.subtype.value =
                                                _filterController.rtype;
                                          } else if(value=='Commercial') {
                                       _filterController.subpropertytype.value='All';
                                            _filterController.subtype.value =
                                                _filterController.ctype;
                                          } else {
                                       _filterController.subpropertytype.value='All';
                                            _filterController.subtype.value = [
                                              'All'
                                            ];
                                          }
                                        },
                                  isExpanded: false,
                                  value: _filterController.propertytype.value,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'SubProperty Type',
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
                            child: Obx(
                                  ()=> DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: _filterController.subtype.value
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
                                  onChanged: (value) {

                                    _filterController.subpropertytype.value=value;

                                  },
                                  isExpanded: false,
                                  value: _filterController.subpropertytype.value,
                                ),
                              ),
                            ),
                          ),
                        ElevatedButton(onPressed: (){setState(() {

                        });Get.back();}, child: Text('save'))],));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            MaterialCommunityIcons.filter,
                            color: Colors.grey[500],
                            size: 20,
                          ),
                          Text(
                            ' FILTER',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: "Regular",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }


  Future<List<PropertyModel>> _futureFunction() async{
    print("property type: ${widget.propertyType.toString()}");
     QuerySnapshot<Map<String,dynamic>> collection;
    if(widget.propertyType=='')
  collection = await FirebaseFirestore.instance.collection("Area").where('status',isEqualTo: 'accept').get();
    else
    collection = await FirebaseFirestore.instance.collection("Area").where('dhaArea',isEqualTo: widget.propertyType).where('status',isEqualTo: 'accept').get();



    print("collection length:"+collection.docs.length.toString());
    // PropertyModel.fromMap(collection.docs[0].data());
    // print("SUCCESSS!!");

   list = collection.docs.map( ( QueryDocumentSnapshot<Map> e) => PropertyModel.fromMap(e.data(),e.id) ,).toList();

    print("list length is " + list.length.toString());
    if(ascendingsort)
    list.sort((a,b)=>int.parse(a.price).compareTo(int.parse(b.price)));
    else if(decendingsort)
      list.sort((b,a)=>int.parse(a.price).compareTo(int.parse(b.price)));
    if(_filterController.propertytype.value!='All')
      {

       var temp=list.where((element) => element.propertyType==_filterController.propertytype.value);
        list=temp.toList();
      }
    if(_filterController.subpropertytype.value!='All')
    {
      var temp=list.where((element) => element.propertySubType==_filterController.subpropertytype.value);
      list=temp.toList();
    }
    if(_filterController.selectedcity.value!='All')
    {
      var temp=list.where((element) => element.dhaArea==_filterController.selectedcity.value);
      list=temp.toList();
    }
    return list;

//    print(collection.docs.length);
//     final x = await DefaultAssetBundle.of(context).loadString('assets/json/feature.json');
//     return x;
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'SORT BY',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: "Regular"),
                  ),
                ),

                CheckboxListTile(
                  value: value1&&checkvalue==0,
                  title: Text(
                    'Price low to high',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "Regular"),
                  ),
                  onChanged: (bool value) {
                    setState(() {
                      ascendingsort=!ascendingsort;
                      value1 = value;
                      checkvalue=0;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                CheckboxListTile(
                  value: value2&&checkvalue==1,
                  title: Text(
                    'Price high to low ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "Regular"),
                  ),
                  onChanged: (bool value) {
                    setState(() {
                      value2 = value;
                      checkvalue=1;
                      decendingsort=!decendingsort;
                    });
                    Navigator.of(context).pop();
                  },
                ),

              ],
            ),
          );
        });
  }
}
