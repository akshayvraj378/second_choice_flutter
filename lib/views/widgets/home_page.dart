import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:second_choice_flutter/controller/product_controller.dart';

import '../../controller/cart_controller.dart';
import '../../model/product_model.dart';
import '../custamized_widgets/custom_appbar.dart';
import '../custamized_widgets/custom_drawer.dart';
import 'car_detail_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool isFavorite = false;
  User? user = FirebaseAuth.instance.currentUser;
  List<bool> isFavoriteList = []; // List to track favorite status of each item
  final CartItemController _CartItemController = Get.put(CartItemController());

  final ProductController _productController = Get.put(ProductController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
        preferredSize: const Size.fromHeight(70),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
              future: _productController.getCarinformationData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // Return a loading indicator or placeholder widget
                //   return const SizedBox(
                //       width: 20,
                //       height: 20,
                //       child: Center(child: CircularProgressIndicator()));
                // } else if (snapshot.hasError) {
                //   // Handle error
                //   return Text('Error: ${snapshot.error}');
                // } else {
                  // Data has been loaded successfully
                  List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
                  int dataLength = data.length;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataLength,
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
                          overview: data[index]['overview']);
                      // Initialize isFavoriteList with false for each item initially
                      if (isFavoriteList.length <= index) {
                        isFavoriteList.add(false);
                      }
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                              () => ProductDetails(productModel: productModel));
                        },
                        child: Card(
                          color: Colors.lightBlue[50],
                          elevation: 8,
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                child: SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Image.network(
                                    "${productModel.carimage![0]}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${productModel.carname}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_today_rounded,
                                            color: Colors.white70),
                                        Text(
                                          "${productModel.modelyear}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w900),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.speed_rounded,
                                            color: Color.fromARGB(
                                                1768, 255, 204, 0)),
                                        Text(
                                          "${productModel.kms}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.info_outline_rounded,
                                            color: Colors.teal),
                                        Text(
                                          "${productModel.fuel}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w900),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.currency_rupee),
                                        Text(
                                          "${productModel.prize}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w900),
                                        )
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        bool isFavorite = isFavoriteList[index]; // Check if item is already favorited

                                        String uId = user!.uid; // Define the uId variable

                                        if (isFavorite) {
                                          // If the item is already favorited, delete it
                                          await FirebaseFirestore.instance
                                              .collection('cart')
                                              .doc(uId)
                                              .collection('cartOrders')
                                              .doc(productModel.productId.toString()) // Provide the document ID to be deleted
                                              .delete();

                                          setState(() {
                                            isFavoriteList[index] = false;
                                          });
                                        } else {
                                          // If the item is not favorited, add it to the favorites
                                          await FirebaseFirestore.instance
                                              .collection('cart')
                                              .doc(uId)
                                              .collection('cartOrders')
                                              .doc(productModel.productId.toString()) // Provide the document ID to be added
                                              .set({
                                            // Here, you can set data for the favorite item if needed
                                            // For example:
                                            'productId': productModel.productId,
                                            'carimage': productModel.carimage,
                                            'carname': productModel.carname,
                                            'modelyear': productModel.modelyear,
                                            'kms': productModel.kms,
                                            'fuel': productModel.fuel,
                                            'prize': productModel.prize,
                                            'color': productModel.color,
                                            'owner': productModel.owner,
                                            'milage': productModel.milage,
                                            'engine': productModel.engine,
                                            'insure': productModel.insure,
                                            'polution': productModel.polution,
                                            'features': productModel.features,
                                            'specification': productModel.specification,
                                            'overview': productModel.overview
                                            // Add other properties as needed
                                          });

                                          setState(() {
                                            isFavoriteList[index] = true;
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        isFavoriteList[index] ? Icons.favorite : Icons.favorite_border,
                                        color: isFavoriteList[index] ? Colors.red : null,
                                        size: 30,
                                      ),
                                    ),



                                  ],
                                ),
                              )
                              // Other car details here
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Text('something error');
              },
            ),
          ),
        ],
      ),
    );
  }
}
