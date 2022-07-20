import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/user_controller.dart';

class TilesBasic extends StatefulWidget {
  final Function onTap;
  TilesBasic({this.context,@required this.onTap});

  final BuildContext context;

  @override
  _TilesBasicState createState() => _TilesBasicState();
}

class _TilesBasicState extends State<TilesBasic> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserController userController = Get.find();

  List<String> _gender = ["Male", "FeMale"];
  // var gender;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      validator: (value){
                        if(value.isEmpty || value == null)
                          return "Field required";
                        else
                          return null;
                      },
                      controller: userController.firstNameController,
                      style: TextStyle(color: Colors.black, fontSize: 12,fontFamily: "Regular"),
                      decoration: InputDecoration(
                        label: Text('First Name'),
                        hintText: 'First Name',
                        hintStyle:     TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Regular"),
                      ),
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      validator: (value){
                        if(value.isEmpty || value == null)
                          return "Field required";
                        else
                          return null;
                      },
                      controller: userController.lastNameController,
                      style: TextStyle(color: Colors.black, fontSize: 12,fontFamily: "Regular"),
                      decoration: InputDecoration(
                        label: Text('Last Name'),
                        hintText: 'Last Name',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Regular"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              width: double.infinity,
              padding: EdgeInsets.only(top: 10,bottom: 10,right: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  validator: (value) => value == null ? 'field required' : null,
                  decoration: InputDecoration(
                    labelText: "Gender",
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero
                  ),
                  hint: Text("Gender",style:TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Regular"),),
                  value: userController.genderSelected,
                  isDense: true,
                  onChanged: (newValue) {
                    setState(() {
                      userController.genderSelected = newValue;
                    });
                    // print(gender);
                  },
                  items: _gender.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Regular"),),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              color: Colors.grey[400],
              height: 1.5,
              margin: EdgeInsets.only(left: 5,right: 5),
            ),
            // Padding(
            //   padding: EdgeInsets.all(5),
            //   child: TextField(
            //     style: TextStyle(color: Colors.black, fontSize: 12,fontFamily: "Regular"),
            //     decoration: InputDecoration(
            //       hintText: 'About You',
            //       hintStyle:TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Regular"),
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () async{
                if(_formKey.currentState.validate()){
                  await widget.onTap();
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFFCC300),
                    borderRadius: BorderRadius.all(
                      const Radius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          'SAVE',
                          style:TextStyle(color: Colors.black, fontSize: 12,fontFamily: "Semibold"),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                        size: 20,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
