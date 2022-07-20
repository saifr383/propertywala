import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/publics/add_property/main.dart';
import 'package:myyaowrealtorfltheme/publics/property_edit/list.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/main.dart';

import '../../backend/models/propertyModel.dart';

class PropertyEdit extends StatefulWidget {
  PropertyEdit({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PropertyState createState() => _PropertyState();
}

class _PropertyState extends State<PropertyEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF265229),
        title: Text(
          'My PROPERTIES',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Semibold',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProperties()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.white,
                ),
              ))
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream:FirebaseFirestore.instance.collection("Area").where('userId',isEqualTo: FirebaseAuth.instance.currentUser.uid).snapshots(),
          // future: DefaultAssetBundle.of(context).loadString('assets/json/feature.json'),
          builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            else {
             List list = snapshot.data.docs.map( ( QueryDocumentSnapshot<Map> e) => PropertyModel.fromMap(e.data(),e.id) ,).toList();
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: ListViews(propertyModel: list[index],id:snapshot.data.docs[index].id),
                  );
                },
                itemCount: list.length,
              );
            }
          }
      ),
    );
  }
}
