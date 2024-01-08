// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:second_choice_flutter/controller/favourate_controller.dart';
// import 'package:second_choice_flutter/view/details_view.dart';
//
// import '../../controller/cart_controller.dart';
// import '../../controller/home_controller.dart';
// import '../../model/favourite_model.dart';
// import '../../model/product_model.dart';
// import '../../view/home_view.dart';
// import '../custamized_widgets/custom_appbar.dart';
// import '../custamized_widgets/custom_drawer.dart';
// import 'car_detail_page.dart';
//

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../controller/favourate_controller.dart';
import '../../model/favourite_model.dart';

import '../custamized_widgets/custom_drawer.dart';

class View_favourites extends StatefulWidget {
  const View_favourites({super.key});

  @override
  State<View_favourites> createState() => _View_favouritesState();
}

class _View_favouritesState extends State<View_favourites> {
  final FavController favController = FavController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
       body:  FutureBuilder<Map<String, List<String>>?>(
        future: favController.getCartData(),
        builder: (BuildContext context, AsyncSnapshot<Map<String, List<String>>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              Map<String, List<String>> cartOrdersData = snapshot.data!;
              return ListView.builder(
                itemCount: cartOrdersData.length,
                itemBuilder: (BuildContext context, int index) {
                  String cartDocumentID = cartOrdersData.keys.elementAt(index);
                  List<String> cartOrderIDs = cartOrdersData[cartDocumentID] ?? [];

                  return FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('cart')
                        .doc(cartDocumentID)
                        .collection('cartOrders')
                        .get(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                      //   return Center(child: CircularProgressIndicator());
                      // } else if (snapshot.hasError) {
                      //   return Center(child: Text('Error: ${snapshot.error}'));
                      // } else {
                      //   if (snapshot.hasData) {
                          List<DocumentSnapshot> documents = snapshot.data!.docs;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: documents.map((DocumentSnapshot doc) {
                              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                              // Create FavModel instance from fetched data
                              FavouriteModel favModel = FavouriteModel(
                                productId: data['productId'],
                                carimage: data['carimage'],
                                carname: data['carname'],
                                modelyear: data['modelyear'],
                                kms: data['kms'],
                                fuel: data['fuel'],
                                prize: data['prize'],
                                color: data['color'],
                                owner: data['owner'],
                                milage: data['milage'],
                                engine: data['engine'],
                                insure: data['insure'],
                                polution: data['polution'],
                                features: data['features'],
                                specification: data['specification'],
                                overview: data['overview'],
                              );

                              return  Card(
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
                                          "${favModel.carimage![0]}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${favModel.carname}",
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
                                                "${favModel.modelyear}",
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
                                                "${favModel.kms}",
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
                                                "${favModel.fuel}",
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
                                                "${favModel.prize}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w900),
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
                            }).toList(),
                          );
                        } else {
                          return Center(child: Text('No data found for $cartDocumentID'));
                        }
                      }

                  );
                },
              );
            } else {
              return Center(child: Text('No favorite items found.',style: TextStyle(color: Colors.white),));
            }
          }
        },
      ),
    );
  }
}







// class Favitems extends StatefulWidget {
//   const Favitems({super.key});
//
//   @override
//   State<Favitems> createState() => _FavitemsState();
// }
//
// class _FavitemsState extends State<Favitems> {
//   User? user = FirebaseAuth.instance.currentUser;
//   final CartItemController _CartItemController = Get.put(CartItemController());
//
//   final FavController favController = FavController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       key: _scaffoldKey,
//       appBar: CustomAppBar(
//         scaffoldKey: _scaffoldKey,
//         preferredSize: const Size.fromHeight(70),
//       ),
//       drawer: CustomDrawer(),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
//               future: _favcontroler.getCartData(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Icon(Icons.favorite_sharp);
//                 } else {
//                   // Data has been loaded successfully
//                   List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
//                   int dataLength = data.length;
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: dataLength,
//                     itemBuilder: (context, index) {
//                       Favmodel favModel = Favmodel(
//                           productId: data[index]['productId'],
//                           carimage: data[index]['carimage'],
//                           carname: data[index]['carname'],
//                           modelyear: data[index]['modelyear'],
//                           kms: data[index]['kms'],
//                           fuel: data[index]['fuel'],
//                           prize: data[index]['prize'],
//                           color: data[index]['color'],
//                           owner: data[index]['owner'],
//                           milage: data[index]['milage'],
//                           engine: data[index]['engine'],
//                           insure: data[index]['insure'],
//                           polution: data[index]['polution'],
//                           features: data[index]['features'],
//                           specification: data[index]['specification'],
//                           overview: data[index]['overview']);
//                       // Initialize isFavoriteList with false for each item initially
//
//                       return Card(
//                         color: Colors.lightBlue[50],
//                         elevation: 8,
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 40),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Column(
//                           children: [
//                             ClipRRect(
//                               borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(10)),
//                               child: SizedBox(
//                                 height: 200,
//                                 child: Image.network(
//                                   "${favModel.carimage![0]}",
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 "${favModel.carname}",
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.w900,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.calendar_today_rounded,
//                                           color: Colors.white70),
//                                       Text(
//                                         "${favModel.modelyear}",
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.w900),
//                                       )
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.speed_rounded,
//                                           color: Color.fromARGB(
//                                               1768, 255, 204, 0)),
//                                       Text(
//                                         "${favModel.kms}",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w900),
//                                       )
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.info_outline_rounded,
//                                           color: Colors.teal),
//                                       Text(
//                                         "${favModel.fuel}",
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.w900),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.currency_rupee),
//                                       Text(
//                                         "${favModel.prize}",
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.w900),
//                                       )
//                                     ],
//                                   ),
//
//
//
//
//                                 ],
//                               ),
//                             )
//                             // Other car details here
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
