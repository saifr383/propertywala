import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/main.dart';
import 'package:myyaowrealtorfltheme/publics/home/agent/main.dart';
import 'package:myyaowrealtorfltheme/publics/home/city/main.dart';
import 'package:myyaowrealtorfltheme/publics/home/feature/main.dart';
import 'package:myyaowrealtorfltheme/publics/home/properties/main.dart';
import 'package:myyaowrealtorfltheme/publics/home/search.dart';
import 'package:myyaowrealtorfltheme/publics/home/tapbar.dart';
import 'package:myyaowrealtorfltheme/publics/property/main.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/main.dart';
import 'package:myyaowrealtorfltheme/widgets/drawer.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List data;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xFF265229),
          statusBarIconBrightness: Brightness.dark),
    );
    return Scaffold(
      key: scaffoldKey,

      backgroundColor: Color(0xFF265229),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          //Tapbar

          //Search Field
          //Feature
          Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/homebg.png',
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Image.asset('assets/images/logo.png',height: 90,width: Get.width*0.6,fit: BoxFit.fill,),
                    //Feature
                    Feature(),
                  ],
                ),
              ],
            ),
          ),

          Container(
            color: Colors.grey[200],
            child: Column(

              children: [
                SizedBox(height: 15,),
                InkWell(
onTap: (){Get.to(()=>Property(''));},
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all( 10),
                        padding:
                        EdgeInsets.only( left: 10),
                        height: 40,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.all(new Radius.circular(25))),

                        child: TextFormField(
                          enabled: false,

                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Regular', fontSize: 12),
                          cursorColor: Colors.black,
                          decoration: new InputDecoration(border: InputBorder.none,
                              prefixIcon: Icon(Icons.mic,color: Color(0xFF265229),),

                              hintText: 'Search Property',
                              hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Regular",
                                  color: Colors.grey)),
                        ),
                      ),
                      Positioned(child:                       Container( decoration: BoxDecoration(color: Color(0xFF265229),shape: BoxShape.circle),height: 50,width: 50,child: Icon(Icons.search,color: Colors.white,),),right: 10,top: 5,)
                    ],
                  ),
                ),
              ],
            ),
          ),
          //popular cities
          Cities(),
          //Recent Properties
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => PropertyDetail()),
          //     );
          //   },
          //   child: RecentProperties(),
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => AgentDetail()),
          //     );
          //   },
          //   child: Agents(),
          // ),
          //Agents
        ],
      ),
    );
  }
}
