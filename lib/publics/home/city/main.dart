import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:myyaowrealtorfltheme/publics/home/city/list.dart';

class Cities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        MaterialCommunityIcons.location_enter,
                        color: Colors.black,
                        size: 18,
                      ),
                      Text(
                        '  POPULAR Areas',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            fontFamily: 'Semibold'),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(left: 20, right: 20),
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //     color: Colors.grey[300],
                //     borderRadius: new BorderRadius.circular(15.0),
                //   ),
                //   child: Text(
                //     'SEE ALL',
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 8,
                //         fontFamily: 'Semibold'),
                //   ),
                // ),
              ],
            ),
          ),
          //Image row1
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SingleCityWidget(
                    "DHA Lahore",
                    image:
                        'assets/images/dhalahore.jpg',
                    location: 'DHA Lahore',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SingleCityWidget(
                    "DHA Multan",
                    image:
                        'assets/images/dhamultan.jpg',
                    location: 'DHA Multan',
                  ),
                ),
              ],
            ),
          ),
          //Image row2
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SingleCityWidget(
                    "DHA Bahawalpur",
                    image:
                        'assets/images/dhabhawal.jpg',
                    location: 'DHA Bahawalpur',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SingleCityWidget(
                    "DHA Gujranwala",
                    image:
                        'assets/images/dhagujra.jpg',
                    location: 'DHA Gujranwala',
                  ),
                ),
              ],
            ),
          ),
          //Image row3
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SingleCityWidget(
                    'DHA Quetta',
                    image:
                        'assets/images/dhaquetta.jpg',
                    location: 'DHA Quetta',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SingleCityWidget(
                    'DHA Islamabad',
                    image:
                        'assets/images/dhaislam.jpg',
                    location: 'DHA Islamabad',
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SingleCityWidget(
                    'DHA Karachi',
                    image:
                    'assets/images/dhakarachi.jpg',
                    location: 'DHA Karachi',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SingleCityWidget(
                    'DHA Peshawar',
                    image:
                    'assets/images/dhapeshawar.jpg',
                    location: 'DHA Peshawar',
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SingleCityWidget(
                    'Others',
                    image:
                    'assets/images/other.jpg',
                    location: 'Others',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
