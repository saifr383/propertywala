import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/auth_controller.dart';
import 'package:myyaowrealtorfltheme/customer/signin/main.dart';

class Register extends StatelessWidget {

  // AuthController _authController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX(
        builder: (AuthController _authController) {
          return ModalProgressHUD(
            inAsyncCall: _authController.loading,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/bg.png',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    title: Text(
                      'SIGN UP!',
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, fontFamily: "Semibold"),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    centerTitle: true,
                  ),
                  body: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 100,
                            width: 120,
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 40, right: 40, top: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            const Radius.circular(10),
                          ),
                        ),
                        child: Form(
                          // autovalidateMode: AutovalidateMode.,
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _authController.firstNameController,
                                          validator: (value){
                                            if(value.isEmpty || value == null)
                                              return "Field required";
                                            else
                                            return null;
                                          },
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: "Regular"),
                                          decoration: InputDecoration(
                                            hintText: 'First Name',
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontFamily: "Regular"),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _authController.lastNameController,
                                            validator: (value){
                                              if(value.isEmpty || value == null)
                                                return "Field required";
                                              else
                                                return null;
                                            },
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: "Regular"),
                                          decoration: InputDecoration(
                                            hintText: 'Last Name',
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontFamily: "Regular"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              CustomDropDownButton(),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: _authController.emailController,
                                    validator: (value){
                                      if(value.isEmpty || value == null)
                                        return "Field required";
                                      else
                                        return null;
                                    },
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: "Regular"),
                                  decoration: InputDecoration(
                                    hintText: 'Email Address',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontFamily: "Regular"),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: _authController.mobileNoController,
                                  validator: (value){
                                    if(value.isEmpty || value == null)
                                      return "Field required";
                                    else
                                      return null;
                                  },

                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: "Regular"),
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Mobile Number',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontFamily: "Regular"),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: _authController.passwordController,
                                  validator: (value){
                                    if(value.isEmpty || value == null)
                                      return "Field required";
                                    else
                                      return null;
                                  },

                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: "Regular"),
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontFamily: "Regular"),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              InkWell(
                                onTap: (){
                                  if(_formKey.currentState.validate())
                                    {
                                      _authController.signUp();
                                    }
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFCC300),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: const Radius.circular(10),
                                          bottomRight: const Radius.circular(10)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            'SIGN UP!',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: "Semibold"),
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.black,
                                          size: 20,
                                        )
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, false);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                'Do you have an account?',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "Regular"),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: "Semibold"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}


class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({Key key}) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {

  List<String> _gender = ["Male", "FeMale"];

  AuthController controller = Get.find();

  // String downValue = null;

  @override
  Widget build(BuildContext context) {
    return  Container(
//      margin: EdgeInsets.only(left: 5),
      width: double.infinity,
      padding: EdgeInsets.only(top: 10,bottom: 10,right: 0),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10)
          ),
          validator: (value) => value == null ? 'field required' : null,
          hint: Text("Gender",style:TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Regular"),),
          value: controller.selectedGender,
          isDense: true,
          onChanged: (newValue) {
            setState(() {
              controller.selectedGender = newValue;
              // controller.selectedGender = newValue;
            });
            print(controller.selectedGender);
          },
          items: _gender.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style: TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Regular"),),
            );
          }).toList(),
        ),
      ),
    );
  }
}

