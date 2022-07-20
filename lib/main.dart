import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:myyaowrealtorfltheme/backend/utils/authWrapper.dart';
import 'package:myyaowrealtorfltheme/publics/splashscreen.dart';
import 'package:myyaowrealtorfltheme/publics/welcome/main.dart';

import 'backend/controllers/bindings/binding.dart';

bool FIRST_RUN;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FIRST_RUN = await IsFirstRun.isFirstRun();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myyaow Realtor',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
      initialBinding: AuthBinding(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
