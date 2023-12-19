// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:second_choice_flutter/view/profile_view.dart';
// import 'package:second_choice_flutter/view/settings_view.dart';
//
// import 'home_view.dart';
//
// class MainPage1 extends StatefulWidget {
//   const MainPage1({super.key});
//
//   @override
//   State<MainPage1> createState() => _MainPage1State();
// }
//
// class _MainPage1State extends State<MainPage1> {
//   int currentSelectedIndex = 0;
//   static final List pages = [
//     const   HomePage(), // Replace YourHomePage() with your actual pages
//     Prof(),
//     Seti(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentSelectedIndex],
//       bottomNavigationBar: CurvedNavigationBar(
//         color: Colors.black,
//         backgroundColor: Colors.transparent,
//         items: const <Widget>[
//           Icon(
//             color: Colors.white,
//             Icons.home,
//             size: 30,
//           ),
//           Icon(
//             color: Colors.white,
//             Icons.favorite,
//             size: 30,
//           ),
//           Icon(
//             Icons.settings,
//             size: 30,
//             color: Colors.white,
//           ),
//         ],
//         onTap: (index) {
//           setState(() {
//             currentSelectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }