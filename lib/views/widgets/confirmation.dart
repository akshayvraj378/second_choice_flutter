// // confirmation_page.dart
//
// import 'package:flutter/material.dart';
//
// class ConfirmationPage extends StatelessWidget {
//   final String name;
//   final String address;
//   final String pincode;
//   final String dist;
//   final String panNumber;
//   final String aadhaarNumber;
//   final String advanceAmount;
//
//   ConfirmationPage({
//     required this.name,
//     required this.address,
//     required this.pincode,
//     required this.dist,
//     required this.panNumber,
//     required this.aadhaarNumber,
//     required this.advanceAmount,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.black,
//       appBar: AppBar(backgroundColor: Colors.black,
//         title: Text('Confirmation Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Card(
//           elevation: 5,
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TicketDetail(label: 'Name', value: name),
//                 TicketDetail(label: 'Address', value: address),
//                 TicketDetail(label: 'Pincode', value: pincode),
//                 TicketDetail(label: 'District', value: dist),
//                 TicketDetail(label: 'PAN Number', value: panNumber),
//                 TicketDetail(label: 'AADHAAR Number', value: aadhaarNumber),
//                 TicketDetail(label: 'Advance Amount', value: advanceAmount),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class TicketDetail extends StatelessWidget {
//   final String label;
//   final String value;
//
//   TicketDetail({required this.label, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '$label:',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// confirmation_page.dart

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:second_choice_flutter/views/widgets/payment.dart';

class ConfirmationPage extends StatelessWidget {
  final String name;
  final String address;
  final String pincode;
  final String dist;
  final String panNumber;
  final String aadhaarNumber;
  final String advanceAmount;

  ConfirmationPage({
    required this.name,
    required this.address,
    required this.pincode,
    required this.dist,
    required this.panNumber,
    required this.aadhaarNumber,
    required this.advanceAmount,
    required File panImage, required File adharImage,
  });

  // Reference to the Firestore collection
  final CollectionReference confirmationCollection =
      FirebaseFirestore.instance.collection('confirmation_data');

  // Function to save data to Firestore
  Future<void> saveToFirestore() {
    return confirmationCollection.add({
      'name': name,
      'address': address,
      'pincode': pincode,
      'dist': dist,
      'panNumber': panNumber,
      'aadhaarNumber': aadhaarNumber,
      'advanceAmount': advanceAmount,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Confirmation Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(color: Colors.transparent,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TicketDetail(label: 'Name', value: name),
                TicketDetail(label: 'Address', value: address),
                TicketDetail(label: 'Pincode', value: pincode),
                TicketDetail(label: 'District', value: dist),
                TicketDetail(label: 'PAN Number', value: panNumber),
                TicketDetail(label: 'AADHAAR Number', value: aadhaarNumber),
                TicketDetail(label: 'Advance Amount', value: advanceAmount),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [SizedBox(height: 30,),
                    Lottie.asset(
                      'assets/json/success.json', // Replace with your animation file
                      width: 200,
                      height: 150,
                      repeat: false, // Set to true if you want to loop the animation
                      reverse: false, // Set to true if you want to play the animation in reverse
                      animate: true,
                    ),
                  ],
                ),
                SizedBox(height: 70,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          await saveToFirestore();
                          Get.off(UpiScreen(
                            name: name,
                            phone: '9744151527',
                            address: address,
                            customerToken: '12345',
                            totalAmount: advanceAmount,
                          ));
                        },
                        child: Text('confirm')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TicketDetail extends StatelessWidget {
  final String label;
  final String value;

  TicketDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,color: Colors.white
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}
