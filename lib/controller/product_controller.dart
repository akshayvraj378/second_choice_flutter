// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
//
//
// class ProductController extends GetxController{
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<List<QueryDocumentSnapshot<Object?>>> getCarinformationData() async {
//     final QuerySnapshot carinformData =
//     await _firestore.collection('carinform').get();
//     return carinformData.docs;
//
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Use Stream instead of Future for real-time updates
  Stream<QuerySnapshot> getCarinformationDataStream() {
    return _firestore.collection('carinform').snapshots();
  }
}