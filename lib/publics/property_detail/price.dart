import 'package:flutter/material.dart';

Widget kPrice(String price, String location,String name) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Semibold",
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        int.parse(price)>=100000?Text(
          'Rs ${int.parse(price)/100000.0} lakh',
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Semibold",
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ):
        Text(
          'Rs ${price.toString()}',
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Semibold",
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.my_location,
                  size: 20,
                  color: Colors.grey,
                ),
                Text(
                  " $location",
                  style: TextStyle(
                      color: Colors.black45,
                      fontFamily: "Regular",
                      fontSize: 12),
                )
              ],
            ))
      ],
    ),
  );
}
