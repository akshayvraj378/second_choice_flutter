// import 'package:flutter/material.dart';
//
// import '../views/widgets/login_page.dart';
// import 'login_view.dart';
//
//
//
// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});
//
//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }
//
// class _ForgotPasswordState extends State<ForgotPassword> {
//   final loginkey = GlobalKey<FormState>();
//   bool pass = false;
//   var passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: ListView(children: [
//           Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Image(
//                 image: AssetImage('assets/images/forgot.jpg'
//                 )),
//             Form(
//               key: loginkey,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: TextFormField(
//                   style: TextStyle(color: Colors.black87),
//                   decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.black12,
//                       hintText: 'Email',
//                       hintStyle: TextStyle(color: Colors.black87),
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.circular(12))),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
//                         .hasMatch(value)) {
//                       return "Enter a valid email address";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 40),
//               child: ElevatedButton(
//                   style: const ButtonStyle(
//                       fixedSize: MaterialStatePropertyAll(Size(150, 50)),
//                       backgroundColor: MaterialStatePropertyAll(Colors.green)),
//                   onPressed: () {
//                     loginkey.currentState!.validate();
//                   },
//                   child: Text('Reset password')),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 60),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.arrow_back_rounded),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Login(),
//                             ),
//                                 (route) => false);
//                       },
//                       child: Text('Back to Login'))
//                 ],
//               ),
//             ),
//           ]),
//         ]),
//       ),
//     );
//   }
// }
