import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:second_choice_flutter/model/product_model.dart';

import '../../controller/cart_controller.dart';
import '../../model/cart_model.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  User? user = FirebaseAuth.instance.currentUser;
  final CartItemController cartItemController = Get.put(CartItemController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('cart')
                      .doc(user!.uid)
                      .collection('cartOrders')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error"),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        height: Get.height / 5,
                        child: Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      );
                    }

                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text("No products found!"),
                      );
                    }

                    if (snapshot.data != null) {
                      return SizedBox(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final productData = snapshot.data!.docs[index];
                            CartModel cartModel = CartModel(
                              productId: productData['productId'],
                              carimage: productData['carimage'],
                              carname: productData['carname'],
                              modelyear: productData['modelyear'],
                              kms: productData['kms'],
                              fuel: productData['fuel'],
                              prize: productData['prize'],
                              color: productData['color'],
                              owner: productData['owner'],
                              milage: productData['milage'],
                              engine: productData['engine'],
                              insure: productData['insure'],
                              polution: productData['polution'],
                              features: productData['features'],
                              specification: productData['specification'],
                              overview: productData['overview'],
                            );

                            //calculate price
                            cartItemController.checkProductExistence(
                                uId: 'uId', productModel: ProductModel());
                            return Card(
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
                                        cartModel.carimage?[0],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      cartModel.carname.toString(),
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
                                            const Icon(
                                                Icons.calendar_today_rounded,
                                                color: Colors.white70),
                                            Text(
                                              cartModel.modelyear.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight
                                                      .w900),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.speed_rounded,
                                                color: Color.fromARGB(
                                                    1768, 255, 204, 0)),
                                            Text(
                                              cartModel.kms.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight
                                                      .w900),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons.info_outline_rounded,
                                                color: Colors.teal),
                                            Text(
                                              cartModel.fuel.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight
                                                      .w900),
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
                                              cartModel.prize.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight
                                                      .w900),
                                            )
                                          ],
                                        ),


                                      ],
                                    ),
                                  )
                                  // Other car details here
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }

                    return Container();
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
