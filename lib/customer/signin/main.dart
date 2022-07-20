import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myyaowrealtorfltheme/backend/controllers/auth_controller.dart';
import 'package:myyaowrealtorfltheme/customer/forgot/main.dart';
import 'package:myyaowrealtorfltheme/customer/register/main.dart';
import 'package:myyaowrealtorfltheme/publics/home/main.dart';
import 'package:myyaowrealtorfltheme/publics/main/main.dart';

class SignIn extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX(
        builder: (AuthController authController) {
          return ModalProgressHUD(
            inAsyncCall: authController.loading,
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
                      'SIGN IN',
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
                            height: 200,
                            width: 2500,
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
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  validator: (value){
                                    if(value.isEmpty || value == null)
                                      return "Field required";
                                    else
                                      return null;
                                  },
                                  controller: authController.emailController,
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
                                  obscureText: true,
                                  validator: (value){
                                    if(value.isEmpty || value == null)
                                      return "Field required";
                                    else
                                      return null;
                                  },
                                  controller: authController.passwordController,
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
                              InkWell(
                                onTap: () {
                                  if(_formKey.currentState.validate())
                                    {
                                      authController.login();
                                    }
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => PublicMain()));
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
                                            'LOGIN',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Forgot()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(top: 15, bottom: 10, right: 40),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: "Regular"),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          'Do not have an account yet?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Regular"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, false);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Column(
                          children: <Widget>[

                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'SIGN UP NOW!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "Semibold"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, false);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PublicMain()),
                          );
                        },
                        child: Column(
                          children: <Widget>[

                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'SIGN In As Guest',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
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
