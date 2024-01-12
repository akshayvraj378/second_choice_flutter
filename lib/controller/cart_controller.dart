// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// import '../model/cart_model.dart';
// import '../model/product_model.dart';
//
// class CartItemController extends GetxController {
//   Future<void> checkProductExistence(
//       {required String uId,
//         int quantityIncrement = 1,
//         required ProductModel productModel}) async {
//     final DocumentReference documentReference = FirebaseFirestore.instance
//         .collection('cart')
//         .doc(uId)
//         .collection('cartOrders')
//         .doc(productModel.productId.toString());
//
//     DocumentSnapshot snapshot = await documentReference.get();
//
//     if (snapshot.exists) {
//       int currentQuantity = snapshot['productQuantity'];
//       int updatedQuantity = currentQuantity + quantityIncrement;
//       double totalPrice = double.parse(productModel.prize!) * updatedQuantity;
//
//       await documentReference.update({
//         'productQuantity': updatedQuantity,
//         'productTotalPrice': totalPrice
//       });
//       Get.snackbar("product exists", "update quantity");
//       print("product exists");
//     } else {
//       await FirebaseFirestore.instance.collection('cart').doc(uId).set(
//         {
//           'uId': uId,
//           'createdAt': DateTime.now(),
//         },
//       );
//       CartModel cartModel = CartModel(
//           productId: productModel.productId,
//           carimage: productModel.carimage,
//           carname: productModel.carname,
//           modelyear: productModel.modelyear,
//           kms: productModel.kms,
//           fuel: productModel.fuel,
//           prize: productModel.prize,
//           color: productModel.color,
//           owner: productModel.owner,
//           milage: productModel.milage,
//           engine: productModel.engine,
//           insure: productModel.insure,
//           polution: productModel.polution,
//           features: productModel.features,
//           specification: productModel.specification,
//           overview: productModel.overview);
//
//       await documentReference.set(cartModel.toMap());
//
//       print("product added");
//       Get.snackbar("Success", "product added");
//     }
//   }
// }
//
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/product_model.dart';

class CartItemController extends GetxController {
  Future<void> checkProductExistence(
      {required String uId, required ProductModel productModel}) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(productModel.productId.toString());

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      // Product already exists in the cart
      Get.snackbar("Product Exists", "This product is already in your cart.");
      print("Product exists");
    } else {
      // Product doesn't exist, add it to the cart
      await FirebaseFirestore.instance.collection('cart').doc(uId).set(
        {
          'uId': uId,
          'createdAt': DateTime.now(),
        },
      );

      print("Product added");
      Get.snackbar("Success", "Product added to your cart.");
    }
  }
}

