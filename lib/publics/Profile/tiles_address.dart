// import 'package:flutter/material.dart';
//
// class TilesAddress extends StatelessWidget {
//   final List<String> gender = ["Male", "FeMale"];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
//       child: Column(children: <Widget>[
//         Padding(
//           padding: EdgeInsets.all(5),
//           child: TextField(
//             style: TextStyle(
//                 color: Colors.black, fontSize: 12, fontFamily: "Regular"),
//             decoration: InputDecoration(
//               hintText: 'Address',
//               hintStyle: TextStyle(
//                   color: Colors.grey, fontSize: 12, fontFamily: "Regular"),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(5),
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 flex: 1,
//                 child: TextField(
//                   style: TextStyle(
//                       color: Colors.black, fontSize: 12, fontFamily: "Regular"),
//                   decoration: InputDecoration(
//                     hintText: 'City',
//                     hintStyle: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 12,
//                         fontFamily: "Regular"),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 10,
//               ),
//               Expanded(
//                 flex: 1,
//                 child: TextField(
//                   style: TextStyle(
//                       color: Colors.black, fontSize: 12, fontFamily: "Regular"),
//                   decoration: InputDecoration(
//                     hintText: 'State',
//                     hintStyle: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 12,
//                         fontFamily: "Regular"),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(5),
//           child: TextField(
//             style: TextStyle(
//                 color: Colors.black, fontSize: 12, fontFamily: "Regular"),
//             decoration: InputDecoration(
//               hintText: 'Country',
//               hintStyle: TextStyle(
//                   color: Colors.grey, fontSize: 12, fontFamily: "Regular"),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(5),
//           child: TextField(
//             style: TextStyle(
//                 color: Colors.black, fontSize: 12, fontFamily: "Regular"),
//             decoration: InputDecoration(
//               hintText: 'Postcode',
//               hintStyle: TextStyle(
//                   color: Colors.grey, fontSize: 12, fontFamily: "Regular"),
//             ),
//           ),
//         ),
//         Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.all(10),
//             margin: EdgeInsets.only(top: 5),
//             decoration: BoxDecoration(
//               color: Color(0xFFFCC300),
//               borderRadius: BorderRadius.all(
//                 const Radius.circular(5),
//               ),
//             ),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     'SAVE',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12,
//                         fontFamily: "Semibold"),
//                   ),
//                 ),
//                 Icon(
//                   Icons.keyboard_arrow_right,
//                   color: Colors.black,
//                   size: 20,
//                 )
//               ],
//             )),
//       ]),
//     );
//   }
// }
