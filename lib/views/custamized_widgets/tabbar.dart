// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../controller/home_controller.dart';
// import '../../model/home_model.dart';
//
// class MyTabbedCard extends StatelessWidget {
//   late Loginmodel productModel;
//
//   MyTabbedCard({super.key, required this.productModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.only(bottom: 20, right: 35, top: 15, left: 35),
//       child: Card(
//         color: Colors.white,
//         child: DefaultTabController(
//           length: 3, // Number of tabs
//           child: SizedBox(
//             child: Column(
//               children: [
//                 TabBar(
//                   labelColor: Colors.black,
//                   tabs: [
//                     Tab(text: 'Feature'),
//                     Tab(text: 'Specifications'),
//                     Tab(text: 'Overview'),
//                   ],
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     children: [
//                       // Content for Tab 1
//                       SizedBox(
//                           width: double.infinity,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               SingleChildScrollView(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.all(6.0),
//                                       child: Text('Central locking'),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(6.0),
//                                       child: Text('Driver air Bag'),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(6.0),
//                                       child: Text('Anti Lock Barking System'),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(6.0),
//                                       child: Text('Power door lock'),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(6.0),
//                                       child: Text('Adjustable seats'),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(6.0),
//                                       child: Text('Driver air Bag'),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(6.0),
//                                       child: Text('Crash sensor'),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(6.0),
//                                       child: Text('Air Conditioner'),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )),
//                       // Content for Tab 2
//                       Center(
//                         child: Text('Content for  2'),
//                       ),
//                       // Content for Tab 3
//                       Center(
//                         child: Text('Content for Tab 3'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
