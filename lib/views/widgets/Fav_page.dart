//
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../../controller/cart_controller.dart';
// import '../../model/product_model.dart';
// import '../custamized_widgets/custom_appbar.dart';
// import 'car_detail_page.dart';
//
// class FavPage extends StatefulWidget {
//   const FavPage({Key? key}) : super(key: key);
//
//   @override
//   _FavPageState createState() => _FavPageState();
// }
//
// class _FavPageState extends State<FavPage> {
//   User? user = FirebaseAuth.instance.currentUser;
//   final CartItemController _cartItemController = Get.put(CartItemController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('cart')
//             .doc(user!.uid)
//             .collection('cartOrders')
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: Container());
//           }
//
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No favorites found!'));
//           }
//
//           List<QueryDocumentSnapshot> data = snapshot.data!.docs;
//           int dataLength = data.length;
//
//           return ListView.builder(
//             itemCount: dataLength,
//             itemBuilder: (context, index) {
//               ProductModel productModel = ProductModel(
//                 productId: data[index]['productId'],
//                 carimage: data[index]['carimage'],
//                 carname: data[index]['carname'],
//                 modelyear: data[index]['modelyear'],
//                 kms: data[index]['kms'],
//                 fuel: data[index]['fuel'],
//                 prize: data[index]['prize'],
//                 color: data[index]['color'],
//                 owner: data[index]['owner'],
//                 milage: data[index]['milage'],
//                 engine: data[index]['engine'],
//                 insure: data[index]['insure'],
//                 polution: data[index]['polution'],
//                 features: data[index]['features'],
//                 specification: data[index]['specification'],
//                 overview: data[index]['overview'],
//               );
//
//               return GestureDetector(
//                 onTap: () {
//                   Get.to(() => ProductDetails(productModel: productModel));
//                 },
//                 child: Card(
//                   color: Colors.lightBlue[50],
//                   elevation: 8,
//                   margin: const EdgeInsets.symmetric(
//                       vertical: 15, horizontal: 40),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius:
//                         const BorderRadius.vertical(top: Radius.circular(10)),
//                         child: SizedBox(
//                           height: 200,
//                           width: double.infinity,
//                           child: CachedNetworkImage(
//                             fit: BoxFit.cover,
//                             imageUrl: "${productModel.carimage![0]}",
//                             placeholder: (context, url) => CircularProgressIndicator(),
//                             errorWidget: (context, url, error) => Icon(Icons.error),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           "${productModel.carname}",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w900,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Model Year: ${productModel.modelyear}',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Fuel: ${productModel.fuel}',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Price: ${productModel.prize}',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             const Icon(Icons.currency_rupee),
//                             Text(
//                               "${productModel.prize}",
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w900,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../controller/cart_controller.dart';
import '../../model/product_model.dart';
import '../custamized_widgets/custom_appbar.dart';
import 'car_detail_page.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  User? user = FirebaseAuth.instance.currentUser;
  final CartItemController _cartItemController = Get.put(CartItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favourite Page'),backgroundColor: Colors.black,centerTitle: true),

      body: Container(decoration: BoxDecoration( gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black,
          Colors.transparent,
        ],
      )),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('cart')
              .doc(user?.uid)
              .collection('cartOrders')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No favorites found!',style: TextStyle(color: Colors.white),));
            }

            List<QueryDocumentSnapshot> data = snapshot.data!.docs;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                ProductModel productModel = ProductModel(
                  productId: data[index]['productId'],
                  carimage: data[index]['carimage'],
                  carname: data[index]['carname'],
                  modelyear: data[index]['modelyear'],
                  kms: data[index]['kms'],
                  fuel: data[index]['fuel'],
                  prize: data[index]['prize'],
                  color: data[index]['color'],
                  owner: data[index]['owner'],
                  milage: data[index]['milage'],
                  engine: data[index]['engine'],
                  insure: data[index]['insure'],
                  polution: data[index]['polution'],
                  features: data[index]['features'],
                  specification: data[index]['specification'],
                  overview: data[index]['overview'],
                );

                return GestureDetector(
                  onTap: () {
                    Get.to(() => ProductDetails(productModel: productModel));
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 8,
                    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: "${productModel.carimage![0]}",
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildText('${productModel.carname}', FontWeight.w900, 20),
                            ],
                          ),
                        ),
                        _buildText('Model Year: ${productModel.modelyear}', null, 16),
                        _buildText('Fuel: ${productModel.fuel}', null, 16),
                        _buildText('Price: ${productModel.prize}', null, 16),
                        _buildText(
                          'Total Price: ${productModel.prize}',
                          FontWeight.w500,
                          16,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildText(String text, FontWeight? fontWeight, double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: Colors.black, // Adjust text color
        ),
      ),
    );
  }
}
