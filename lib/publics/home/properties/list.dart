import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ListViews extends StatelessWidget {
  ListViews({Key key, @required this.kFeatureData, @required this.index})
      : super(key: key);
  final kFeatureData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.only(
                topRight: const Radius.circular(5),
                topLeft: const Radius.circular(5)),
            child: Image.network(
              '' + kFeatureData[index]['image'],
              height: 120.0,
              width: MediaQuery.of(context).size.width / 1.8,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width / 1.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    '' + kFeatureData[index]['price'],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'Semibold'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10, top: 3),
                  child: Text(
                    '' + kFeatureData[index]['location'],
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontFamily: 'Semibold'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                MaterialCommunityIcons.bed_empty,
                                color: Colors.grey[500],
                                size: 18,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  '' + kFeatureData[index]['bedroom'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Semibold'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                MaterialCommunityIcons.bed_empty,
                                color: Colors.grey[500],
                                size: 18,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  '' + kFeatureData[index]['bathroom'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Semibold'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
