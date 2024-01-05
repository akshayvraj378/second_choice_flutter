import 'package:cloud_firestore/cloud_firestore.dart';

class FavController {
  Future<Map<String, List<String>>?> getCartData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .get();

      Map<String, List<String>> cartOrdersDataMap = {};

      for (QueryDocumentSnapshot cartDoc in querySnapshot.docs) {
        String cartDocumentID = cartDoc.id;

        QuerySnapshot cartOrdersSnapshot = await FirebaseFirestore.instance
            .collection('cart')
            .doc(cartDocumentID)
            .collection('cartOrders')
            .get();

        List<String> cartOrderIDs = cartOrdersSnapshot.docs
            .map((doc) => doc.id)
            .toList();

        cartOrdersDataMap[cartDocumentID] = cartOrderIDs;
      }

      if (cartOrdersDataMap.isNotEmpty) {
        return cartOrdersDataMap; // Return the fetched data in Map format
      }


      else {
        print('No cart orders data found.');
        return null; // Return null if no data found
      }
    } catch (e, stackTrace) {
      print('Error fetching cart orders data: $e');
      print('Stack Trace: $stackTrace');
      return null; // Return null in case of any errors
    }
  }
}
