import 'dart:convert';

class PropertyModel {
  String name;
  String userId;
  String propertyType;
  String propertySubType;
  String des;
  int bedroom;
  int bathroom;
  String price;
  String area;
  String address;
  String dhaArea;
  String uid;
  List<String> images;
  String status;
  bool boosted;

  PropertyModel(
      this.name,
      this.propertyType,
      this.propertySubType,
      this.des,
      this.bedroom,
      this.bathroom,
      this.price,
      this.area,
      this.address,
      this.dhaArea,
      this.images,
      this.userId,
      this.status,
      {this.uid = '', this.boosted = false}
      );

  Map<String, dynamic> toMap() {
    return {
      'boosted': this.boosted,
      "userId" : this.userId,
      'name': this.name ?? "",
      'propertyType': this.propertyType ?? "",
      'propertySubType': this.propertySubType ?? "",
      'des': this.des ?? "",
      'bedroom': this.bedroom ?? 0,
      'bathroom': this.bathroom ?? 0,
      'price': this.price ?? "",
      'area': this.area ?? "",
      'address': this.address ?? "",
      'dhaArea': this.dhaArea ?? "",
      'images': this.images,
      'status':this.status
    };
  }

  factory PropertyModel.fromMap(Map<String, dynamic> map,
      String uid
      ) {
    List images= (map["images"] as List).map((item) => item as String).toList();
    if(images.isEmpty||images.length==0)
      images.add('https://firebasestorage.googleapis.com/v0/b/propertyapp-20496.appspot.com/o/download.png?alt=media&token=24be5501-7187-4814-a1cf-6a8624d42309');
    return PropertyModel(
        map['name'] as String,
        map['propertyType'] as String,
        map['propertySubType'] as String,
        map['des'] as String,
        map['bedroom'] as int,
        map['bathroom'] as int,
        map['price'] as String,
        map['area'] as String,
        map['address'] as String,
        map['dhaArea'] as String,
        images,
        map["userId"] as String,
        map['status'] as String,
        uid: uid,
        boosted: map['boosted']  ?? false

        // map['images'] as List<String>,
        );
  }
}
