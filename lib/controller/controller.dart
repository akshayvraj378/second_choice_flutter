// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
//
// class EventCategoryController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<List<QueryDocumentSnapshot<Object?>>> getEventCategoryData() async {
//     final QuerySnapshot eventCategoryData =
//     await _firestore.collection('eventcategory').get();
//     return eventCategoryData.docs;
  //}
// }
// controller.dart

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/home_model.dart';

class FirestoreController {
  final CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('fire');

  Future<List<Item>> getItems() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    return querySnapshot.docs.map((doc) {
      return Item.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
