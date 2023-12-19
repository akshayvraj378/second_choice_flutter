// class Carddetails {
//
//   late String? carimage;
//   late String? carname;
//
//   Carddetails({ required this.carimage, required this.carname});
//   //convert json data to dart objects
//   factory Carddetails.fromJson(Map<String, dynamic> json) {
//     return Carddetails(
//
//         carimage: json['carname'],
//         carname: json['carimage']);
//   }
//   //convert dart object to Json data
//   Map<String, dynamic> toJson() {
//     return {
//
//       'carimage': carimage,
//       'carname': carname
//     };
//   }
// }


// model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String title;
  final String description;

  Item({
    required this.title,
    required this.description,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {

      'title': title,
      'description': description
    };
  }
}
