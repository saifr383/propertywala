import 'dart:convert';

class BannerModel {
  String name;
  String des;
  String uid;
  String images;

  BannerModel(
      this.name,
      this.des,
      this.images,

      {this.uid = '',}
      );

  Map<String, dynamic> toMap() {
    return {
      'name': this.name ?? "",
      'des': this.des ?? "",
      'images': this.images,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map,
      String uid
      ) {
    return BannerModel(
        map['name'] as String,
        map['des'] as String,
      map['images'] as String,
      uid:uid

      // map['images'] as List<String>,
    );
  }
}
