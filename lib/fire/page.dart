// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../controller/controller.dart';
// import '../model/home_model.dart';
//
//
// class EventCategoryItem extends StatefulWidget {
//   const EventCategoryItem({super.key});
//
//   @override
//   State<EventCategoryItem> createState() => _EventCategoryItemState();
// }
//
// class _EventCategoryItemState extends State<EventCategoryItem> {
//   final EventCategoryController _eventCategoryController =
//   Get.put(EventCategoryController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
//             future: _eventCategoryController.getEventCategoryData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 // Return a loading indicator or placeholder widget
//                 return SizedBox(
//                     width: 20,
//                     height: 20,
//                     child: const Center(child: CircularProgressIndicator()));
//               } else if (snapshot.hasError) {
//                 // Handle error
//                 return Text('Error: ${snapshot.error}');
//               } else {
//                 // Data has been loaded successfully
//                 List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
//                 int dataLength = data.length;
//              // Rest of your widget tree using the 'data'
//
//                 // return GridView.builder(
//                 //   itemCount: dataLength,
//                 //   shrinkWrap: true,
//                 //   physics: const BouncingScrollPhysics(),
//                 //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 //     crossAxisCount: 2,
//                 //     mainAxisSpacing: 5,
//                 //     crossAxisSpacing: 5,
//                 //     childAspectRatio: 0.80,
//                 //   ),
//                 //   itemBuilder: (context, index) {
//                 //     Carddetails productModel = Carddetails(
//                 //        carname:  data[index]['carname'],
//                 //         carimage: data[index]['carimage']);
//                 //     return Container(
//                 //       decoration: BoxDecoration(
//                 //           border: Border.all(
//                 //             color: Colors.black26,
//                 //             width: 2.0,
//                 //           ),
//                 //           color: Colors.white,
//                 //           borderRadius: BorderRadius.circular(15),
//                 //           boxShadow: [
//                 //             BoxShadow(
//                 //                 color: Colors.grey.withOpacity(.5),
//                 //                 offset: const Offset(3, 2),
//                 //                 blurRadius: 7)
//                 //           ]),
//                 //       child: Column(
//                 //         children: [
//                 //           GestureDetector(
//                 //             onTap: () {},
//                 //             child: SizedBox(
//                 //               width: 150,
//                 //               height: 150,
//                 //               child: Padding(
//                 //                 padding: EdgeInsets.all(13.0),
//                 //                 child: Image.network(
//                 //                   "${productModel.carimage}",
//                 //                   width: double.infinity,
//                 //                 ),
//                 //               ),
//                 //             ),
//                 //           ),
//                 //           Flexible(
//                 //             child: Text(
//                 //               "${productModel.carname}",
//                 //               style: TextStyle(
//                 //                   color: const Color(0xFF505050),
//                 //                   fontFamily: 'Poppins',
//                 //                   fontSize: 14,
//                 //                   fontWeight: FontWeight.w600),
//                 //             ),
//                 //           ),
//                 //           SizedBox(
//                 //             height: 10,
//                 //           ),
//                 //           Flexible(
//                 //             child: Row(
//                 //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //               children: [
//                 //                 Padding(
//                 //                   padding: EdgeInsets.only(left: 13.0),
//                 //                   child: Text(
//                 //                     'dara',
//                 //                     style: TextStyle(
//                 //                         color: const Color(0xFFCF1919),
//                 //                         fontFamily: 'Poppins',
//                 //                         fontSize: 14,
//                 //                         fontWeight: FontWeight.w400),
//                 //                   ),
//                 //                 ),
//                 //                 SizedBox(
//                 //                   width: 30,
//                 //                 ),
//                 //                 Flexible(
//                 //                   child: CircleAvatar(
//                 //                     radius: 20.0,
//                 //                     backgroundColor: const Color(0xFF660018),
//                 //                     child: IconButton(
//                 //                         icon: const Icon(
//                 //                             Icons.add_shopping_cart,
//                 //                             color: Colors.white),
//                 //                         onPressed: () async {}),
//                 //                   ),
//                 //                 )
//                 //               ],
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //     );
//                 //   },
//                 // );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// view.dart

import 'package:flutter/material.dart';

import '../controller/controller.dart';
import '../model/home_model.dart';

class FirestoreView extends StatefulWidget {
  @override
  _FirestoreViewState createState() => _FirestoreViewState();
}

class _FirestoreViewState extends State<FirestoreView> {
  final FirestoreController _controller = FirestoreController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Example'),
      ),
      body: FutureBuilder<List<Item>>(
        future: _controller.getItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            List<Item> items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index].title),
                  subtitle: Text(items[index].description),
                  // Add other widgets to display other data fields
                );
              },
            );
          }
        },
      ),
    );
  }
}
