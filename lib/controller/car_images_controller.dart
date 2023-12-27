// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ImageController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   // Observable list to store image URLs
//   var imageUrls = <String>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchImages(); // Fetch images when the controller is initialized
//   }
//
//   Future<void> fetchImages() async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore.collection('carinform').get();
//       List<String> urls = querySnapshot.docs.map((doc) => doc['carimage'] as String).toList();
//       imageUrls.assignAll(urls); // Assign fetched URLs to imageUrls
//     } catch (e) {
//       print('Error fetching images: $e');
//     }
//   }
// }
