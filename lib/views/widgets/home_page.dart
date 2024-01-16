


import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:second_choice_flutter/controller/product_controller.dart';
import '../../controller/cart_controller.dart';
import '../../model/product_model.dart';
import '../custamized_widgets/custom_appbar.dart';
import '../custamized_widgets/custom_drawer.dart';
import 'car_detail_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  void configLoading() {
    EasyLoading.instance
      .displayDuration = const Duration(milliseconds: 10);
  }

  User? user = FirebaseAuth.instance.currentUser;
  List<bool> isFavoriteList = [];
  final CartItemController cartItemController = Get.put(CartItemController());
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
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _productController.getCarinformationDataStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  configLoading();
                  return Center(child: CustomLoadingIndicator());
                }

                if (snapshot.hasError) {
                  configLoading();
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  configLoading();
                  return Center(child: Text('No products found!'));
                }

                List<QueryDocumentSnapshot> data = snapshot.data!.docs;
                int dataLength = data.length;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataLength,
                  itemBuilder: (context, index) {
                    return ProductListItem(
                      data: data[index],
                      cartItemController: cartItemController,
                      productController: _productController,
                      isFavoriteList: isFavoriteList,
                      scaffoldKey: _scaffoldKey,
                      user: user!,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductListItem extends StatefulWidget {
  final QueryDocumentSnapshot data;
  final CartItemController cartItemController;
  final ProductController productController;
  final List<bool> isFavoriteList;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final User user;

  ProductListItem({
    required this.data,
    required this.cartItemController,
    required this.productController,
    required this.isFavoriteList,
    required this.scaffoldKey,
    required this.user,
  });

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  late bool isProductInFavorites;

  @override
  void initState() {
    super.initState();
    isProductInFavorites = false;
    checkIfProductInFavorites();
  }

  void checkIfProductInFavorites() async {
    isProductInFavorites = await widget.cartItemController
        .checkIfProductInFavorites(widget.user.uid,
        widget.data['productId'].toString());

    setState(() {
      widget.isFavoriteList.add(isProductInFavorites);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataDoc = widget.data.data() as Map<String, dynamic>;
    ProductModel productModel = ProductModel.fromJson(dataDoc);

    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails(productModel: productModel));
      },
      child: Card(
        color: Colors.lightBlue[50],
        elevation: 8,
        margin:
        const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
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
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '${productModel.carimage![0]}',
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
                      const Icon(
                          Icons.calendar_today_rounded,
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
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () async {
                        String uId = widget.user.uid;

                        if (isProductInFavorites) {
                          await FirebaseFirestore.instance
                              .collection('cart')
                              .doc(uId)
                              .collection('cartOrders')
                              .doc(productModel.productId
                              .toString())
                              .delete();

                          setState(() {
                            isProductInFavorites = false;
                          });
                        } else {
                          await FirebaseFirestore.instance
                              .collection('cart')
                              .doc(uId)
                              .collection('cartOrders')
                              .doc(productModel.productId
                              .toString())
                              .set({
                            'productId':
                            productModel.productId,
                            'carimage':
                            productModel.carimage,
                            'carname':
                            productModel.carname,
                            'modelyear':
                            productModel.modelyear,
                            'kms': productModel.kms,
                            'fuel': productModel.fuel,
                            'prize': productModel.prize,
                            'color': productModel.color,
                            'owner': productModel.owner,
                            'milage': productModel.milage,
                            'engine': productModel.engine,
                            'insure': productModel.insure,
                            'polution':
                            productModel.polution,
                            'features':
                            productModel.features,
                            'specification':
                            productModel.specification,
                            'overview':
                            productModel.overview,
                          });

                          setState(() {
                            isProductInFavorites = true;
                          });
                        }
                      },
                      icon: Icon(
                        isProductInFavorites
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isProductInFavorites
                            ? Colors.red
                            : Colors.black38,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomLoadingIndicator extends StatelessWidget {
  CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/json/loading.json', // Replace with your animation file
        width: 200,
        height: 150,
        repeat: true, // Set to true if you want to loop the animation
        reverse: false, // Set to true if you want to play the animation in reverse
        animate: true,
      ),
    );
  }
}
