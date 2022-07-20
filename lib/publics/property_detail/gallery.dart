import 'package:flutter/material.dart';

Widget kGallery(BuildContext context, List<String> image) {
  // List<String> image = [
  //   'assets/images/home.jpg',
  //   'assets/images/gallery1.jpg',
  //   'assets/images/gallery2.jpg',
  //   'assets/images/gallery3.jpg',
  //   'assets/images/gallery4.jpg',
  // ];

  return Container(
    color: Colors.grey[300],
    padding: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
    child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5),
          child: Text(
            'Photo Gallery',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontFamily: "Semibold"),
          ),
        ),
        Container(
          height: 160,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                width: 170,
                margin: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    '' + image[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: image == null ? 0 : image.length,
          ),
        )
      ],
    ),
  );
}
