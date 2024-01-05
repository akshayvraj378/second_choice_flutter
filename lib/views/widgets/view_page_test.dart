// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:second_choice_flutter/controller/favourate_controller.dart';
// import '../../controller/cart_controller.dart';
//
// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }
//
// class _CartPageState extends State<CartPage> {
//   final FavController _favController = Get.put(FavController());
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart Items'),
//       ),
//       body: FutureBuilder<Map<String, dynamic>?>(
//         future: _favController.getCartData(), // Call the method to fetch data
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator(); // Show loading indicator
//           } else if (snapshot.hasError) {
//             return Text('Error fetching favorites'); // Show error message if error occurred
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Text('No favorites available'); // Show message when no data or empty data
//           } else {
//             // Display the fetched data
//             Map<String, dynamic>? favData = snapshot.data;
//             return ListView(
//               children: favData!.entries.map((entry) {
//                 return ListTile(
//                   title: Text(entry.key),
//                   subtitle: Text(entry.value.toString()),
//                 );
//               }).toList(),
//             );
//           }
//         },
//       ),
//
//
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../../controller/favourate_controller.dart';
//
// class CartOrdersView extends StatelessWidget {
//   final FavController favController = FavController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart Orders'),
//       ),
//       body: FutureBuilder<Map<String, List<String>>?>(
//         future: favController.getCartData(),
//         builder: (BuildContext context, AsyncSnapshot<Map<String, List<String>>?> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//               Map<String, List<String>> cartOrdersData = snapshot.data!;
//
//               return ListView.builder(
//                 itemCount: cartOrdersData.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   String cartDocumentID = cartOrdersData.keys.elementAt(index);
//                   List<String> cartOrderIDs = cartOrdersData[cartDocumentID] ?? [];
//
//                   return FutureBuilder<QuerySnapshot>(
//                     future: FirebaseFirestore.instance
//                         .collection('cart')
//                         .doc(cartDocumentID)
//                         .collection('cartOrders')
//                         .get(),
//                     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(child: CircularProgressIndicator());
//                       } else if (snapshot.hasError) {
//                         return Center(child: Text('Error: ${snapshot.error}'));
//                       } else {
//                         if (snapshot.hasData) {
//                           List<DocumentSnapshot> documents = snapshot.data!.docs;
//
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: documents.map((DocumentSnapshot doc) {
//                               Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//                               return ListTile(
//                                 //title: Text('Document ID: ${doc.id}'),
//                                 subtitle: Text(data.toString()), // Display all data here
//                               );
//                             }).toList(),
//                           );
//                         } else {
//                           return Center(child: Text('No data found for $cartDocumentID'));
//                         }
//                       }
//                     },
//                   );
//                 },
//               );
//             } else {
//               return Center(child: Text('No cart orders data found.'));
//             }
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../controller/favourate_controller.dart';
import '../../model/favourite_model.dart';

class FavItemsView extends StatelessWidget {
  final FavController favController = FavController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      body: FutureBuilder<Map<String, List<String>>?>(
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        if (snapshot.hasData) {
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
                    },
                  );
                },
              );
            } else {
              return Center(child: Text('No favorite items found.'));
            }
          }
        },
      ),
    );
  }
}
