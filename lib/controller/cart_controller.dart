import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/product_model.dart';

class CartItemController extends GetxController {
  RxBool loading = false.obs;
  void updateLoading(){
    loading.toggle();
  }
  Future<void> checkProductExistence(
      {required String uId, required ProductModel productModel}) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(productModel.productId.toString());

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
    } else {
      await FirebaseFirestore.instance.collection('cart').doc(uId).set(
        {
          'uId': uId,
          'createdAt': DateTime.now(),
        },
      );
    }
  }


  Future<bool> checkIfProductInFavorites(
      String userId, String productId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('cart')
        .doc(userId)
        .collection('cartOrders')
        .doc(productId)
        .get();

    return doc.exists;
  }




}
