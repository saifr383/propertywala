import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myyaowrealtorfltheme/publics/search/main.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF265229),
        child: Container(
            padding: EdgeInsets.only(left: 15),
            margin: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(new Radius.circular(5))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Flexible(
                  child: SizedBox(
                    width: Get.width*0.6,
                    child: TextField(
                      style: TextStyle(color: Colors.black, fontFamily: 'Regular',fontSize: 10),
                      cursorColor: Colors.black,
                      decoration: new InputDecoration.collapsed(
                          hintText: 'e.g.Brixton, NW3 or NW3 5TV',
                          hintStyle: TextStyle(fontSize: 10,fontFamily: "Regular",)
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 15,
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Search()),
                    );
                  },
                )
              ],
            ),
        ) );
  }
}
