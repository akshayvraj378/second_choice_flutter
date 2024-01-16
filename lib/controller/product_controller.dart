
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool loading = false.obs;
  void updateLoading(){
    loading.toggle();
  }
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Use Stream instead of Future for real-time updates
  Stream<QuerySnapshot> getCarinformationDataStream() {
    return _firestore.collection('carinform').snapshots();
  }
}
