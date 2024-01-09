// // import 'package:flutter/material.dart';
// // import 'package:second_choice_flutter/controller/google_sign_in.dart';
// // import 'package:second_choice_flutter/view/registration_view.dart';
// //
// // import '../../view/forgot_password_view.dart';
// // import 'home_page.dart';
// //
// // class LoginPage extends StatefulWidget {
// //   const LoginPage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<LoginPage> createState() => _LoginPageState();
// // }
// //
// // class _LoginPageState extends State<LoginPage> {
// //   final loginKey = GlobalKey<FormState>();
// //   bool obscurePassword = true;
// //   var passwordController = TextEditingController();
// //   var emailController = TextEditingController();
// //   GoogleSignInController googleSignInController=GoogleSignInController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     return SafeArea(
// //       child: Scaffold(
// //         backgroundColor: Colors.white12,
// //         body: Form(
// //           key: loginKey,
// //           child: ListView(
// //             children: [
// //               Stack(
// //                 children: [
// //                   SizedBox(
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.end,
// //                       children: [
// //                         const SizedBox(
// //                           child: Image(
// //                               image: AssetImage('assets/images/img16.jpg')),
// //                         ),
// //                         Container(
// //                           height: 650,
// //                           width: size.width,
// //                           decoration: const BoxDecoration(
// //                             color: Colors.white,
// //                             borderRadius: BorderRadius.only(
// //                               topRight: Radius.circular(45),
// //                               topLeft: Radius.circular(45),
// //                             ),
// //                           ),
// //                           child: Column(
// //                             children: [
// //                               const Padding(
// //                                 padding: EdgeInsets.only(top: 20),
// //                                 child: Row(
// //                                   mainAxisAlignment: MainAxisAlignment.start,
// //                                   children: [
// //                                     Padding(
// //                                       padding:
// //                                       EdgeInsets.only(left: 15, bottom: 40),
// //                                       child: Text(
// //                                         'Welcome back!',
// //                                         style: TextStyle(
// //                                           color: Colors.black,
// //                                           fontSize: 30,
// //                                           fontWeight: FontWeight.w900,
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                               Padding(
// //                                 padding:
// //                                 const EdgeInsets.only(left: 18, right: 18),
// //                                 child: Container(
// //                                   height: 280,
// //                                   decoration: BoxDecoration(
// //                                     gradient: const LinearGradient(
// //                                       colors: [
// //                                         Colors.white24,
// //                                         Colors.white38,
// //                                         Colors.blueGrey,
// //                                       ],
// //                                     ),
// //                                     boxShadow: const [
// //                                       BoxShadow(
// //                                         blurRadius: 2,
// //                                         color: Colors.black12,
// //                                       ),
// //                                     ],
// //                                     color: Colors.white,
// //                                     borderRadius: BorderRadius.circular(15),
// //                                   ),
// //                                   child: SingleChildScrollView(
// //                                     child: Column(
// //                                       crossAxisAlignment:
// //                                       CrossAxisAlignment.start,
// //                                       children: [
// //                                         const Padding(
// //                                           padding: EdgeInsets.all(11.0),
// //                                           child: Center(
// //                                             child: Text(
// //                                               'Login',
// //                                               style: TextStyle(
// //                                                 fontWeight: FontWeight.w900,
// //                                                 fontSize: 30,
// //                                               ),
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         const Padding(
// //                                           padding: EdgeInsets.only(left: 20),
// //                                           child: Text(
// //                                             'Email',
// //                                             style: TextStyle(
// //                                               fontWeight: FontWeight.w600,
// //                                               fontSize: 16,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         Padding(
// //                                           padding: const EdgeInsets.only(
// //                                               left: 19, right: 19),
// //                                           child: TextFormField(
// //                                             controller: emailController,
// //                                             validator: (value) {
// //                                               if (value == null ||
// //                                                   value.isEmpty) {
// //                                                 return 'Please enter your email';
// //                                               }
// //                                               if (!RegExp(
// //                                                   r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
// //                                                   .hasMatch(value)) {
// //                                                 return 'Enter a valid email address';
// //                                               }
// //                                               return null;
// //                                             },
// //                                             decoration: const InputDecoration(
// //                                               prefixIcon: Icon(
// //                                                   Icons.attach_email_outlined),
// //                                               hintText: 'Enter your email',
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         const Padding(
// //                                           padding: EdgeInsets.only(
// //                                               left: 20, top: 20),
// //                                           child: Text(
// //                                             'Password',
// //                                             style: TextStyle(
// //                                               fontWeight: FontWeight.w600,
// //                                               fontSize: 16,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         Padding(
// //                                           padding: const EdgeInsets.only(
// //                                               left: 19, right: 19),
// //                                           child: TextFormField(
// //                                             controller: passwordController,
// //                                             obscureText: obscurePassword,
// //                                             decoration: InputDecoration(
// //                                               prefixIcon:
// //                                               Icon(Icons.lock_clock),
// //                                               suffixIcon: IconButton(
// //                                                 onPressed: () {
// //                                                   setState(() {
// //                                                     obscurePassword =
// //                                                     !obscurePassword;
// //                                                   });
// //                                                 },
// //                                                 icon: Icon(obscurePassword
// //                                                     ? Icons.visibility
// //                                                     : Icons.visibility_off),
// //                                               ),
// //                                               hintText: 'Enter your password',
// //                                             ),
// //                                             validator: (value) {
// //                                               if (value == null ||
// //                                                   value.isEmpty) {
// //                                                 return 'Please enter your password';
// //                                               }
// //                                               // Additional password validation can be added here if needed
// //                                               return null;
// //                                             },
// //                                           ),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ),
// //                               Padding(
// //                                 padding: const EdgeInsets.all(8.0),
// //                                 child: Row(
// //                                   mainAxisAlignment:
// //                                   MainAxisAlignment.spaceAround,
// //                                   children: [
// //                                     TextButton(
// //                                       onPressed: () {
// //                                         Navigator.push(
// //                                             context,
// //                                             MaterialPageRoute(
// //                                               builder: (context) =>
// //                                                   ForgotPassword(),
// //                                             ));
// //                                       },
// //                                       child: Text('Forgot password'),
// //                                     ),
// //                                     ElevatedButton(
// //                                       style: ButtonStyle(
// //                                         fixedSize: MaterialStateProperty.all(
// //                                             Size(100, 40)),
// //                                         backgroundColor:
// //                                         MaterialStateProperty.all(
// //                                             Colors.blue),
// //                                       ),
// //                                       onPressed: () {
// //                                         if (loginKey.currentState!.validate()) {
// //                                           Navigator.push(
// //                                               context,
// //                                               MaterialPageRoute(
// //                                                 builder: (context) =>
// //                                                     ProductList(),
// //                                               ));
// //                                         }
// //                                       },
// //                                       child: Text('Login'),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                               Padding(
// //                                 padding: const EdgeInsets.all(30),
// //                                 child: Row(
// //                                   mainAxisAlignment: MainAxisAlignment.center,
// //                                   children: [
// //                                     Text(
// //                                       'Do not have an account?',
// //                                     ),
// //                                     TextButton(
// //                                       onPressed: () {
// //                                         Navigator.push(
// //                                             context,
// //                                             MaterialPageRoute(
// //                                               builder: (context) => New(),
// //                                             ));
// //                                       },
// //                                       child: Text('Register'),
// //
// //                                     )
// //                                   ],
// //                                 ),
// //                               ),
// //                               IconButton(onPressed: () {
// //                                 setState(() {
// //                                   googleSignInController.signInWithGoogle();                                });
// //                               }, icon: Image(image: AssetImage('assets/images/google.jpg')))
// //
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shimmer/shimmer.dart';
//
// import '../../controller/email_password_controller.dart';
// import '../../controller/google_sign_in.dart';
// import '../../view/forgot_password_view.dart';
// import '../../view/registration_view.dart';
// import 'home_page.dart';
//
//
// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _BridgeState();
// }
//
// var emailController = TextEditingController();
// var passwordController = TextEditingController();
// bool passVisible = false;
//
// class _BridgeState extends State<Login> {
//   bool obscurePassword = true;
//
//   final loginKey = GlobalKey<FormState>();
//
//   final EmailPassController _emailPassController =
//   Get.put(EmailPassController());
//   final GoogleSignInController _googleSignInController =
//   Get.put(GoogleSignInController());
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Form(
//         key: loginKey,
//         child: Container(
//           decoration: const BoxDecoration(color: Colors.white),
//           child: FutureBuilder(
//             future: Future.delayed(const Duration(seconds: 1)),
//             // Add delay here
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 // Return the shimmer effect while waiting
//                 return ListView(
//                   children: [
//                     Stack(
//                       children: [
//                         SizedBox(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               const SizedBox(
//                                 child: Image(
//                                     image: AssetImage('assets/images/img16.jpg')),
//                               ),
//                               Container(
//                                 height: 650,
//                                 width: size.width,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(45),
//                                     topLeft: Radius.circular(45),
//                                   ),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     const Padding(
//                                       padding: EdgeInsets.only(top: 20),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                             EdgeInsets.only(left: 15, bottom: 40),
//                                             child: Text(
//                                               'Welcome back!',
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 30,
//                                                 fontWeight: FontWeight.w900,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding:
//                                       const EdgeInsets.only(left: 18, right: 18),
//                                       child: Container(
//                                         height: 280,
//                                         decoration: BoxDecoration(
//                                           gradient: const LinearGradient(
//                                             colors: [
//                                               Colors.white24,
//                                               Colors.white38,
//                                               Colors.blueGrey,
//                                             ],
//                                           ),
//                                           boxShadow: const [
//                                             BoxShadow(
//                                               blurRadius: 2,
//                                               color: Colors.black12,
//                                             ),
//                                           ],
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.circular(15),
//                                         ),
//                                         child: SingleChildScrollView(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                             children: [
//                                               const Padding(
//                                                 padding: EdgeInsets.all(11.0),
//                                                 child: Center(
//                                                   child: Text(
//                                                     'Login',
//                                                     style: TextStyle(
//                                                       fontWeight: FontWeight.w900,
//                                                       fontSize: 30,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               const Padding(
//                                                 padding: EdgeInsets.only(left: 20),
//                                                 child: Text(
//                                                   'Email',
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 16,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 19, right: 19),
//                                                 child: TextFormField(
//                                                   controller: emailController,
//                                                   validator: (value) {
//                                                     if (value == null ||
//                                                         value.isEmpty) {
//                                                       return 'Please enter your email';
//                                                     }
//                                                     if (!RegExp(
//                                                         r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
//                                                         .hasMatch(value)) {
//                                                       return 'Enter a valid email address';
//                                                     }
//                                                     return null;
//                                                   },
//                                                   decoration: const InputDecoration(
//                                                     prefixIcon: Icon(
//                                                         Icons.attach_email_outlined),
//                                                     hintText: 'Enter your email',
//                                                   ),
//                                                 ),
//                                               ),
//                                               const Padding(
//                                                 padding: EdgeInsets.only(
//                                                     left: 20, top: 20),
//                                                 child: Text(
//                                                   'Password',
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 16,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 19, right: 19),
//                                                 child: TextFormField(
//                                                   controller: passwordController,
//                                                   obscureText: obscurePassword,
//                                                   decoration: InputDecoration(
//                                                     prefixIcon:
//                                                     Icon(Icons.lock_clock),
//                                                     suffixIcon: IconButton(
//                                                       onPressed: () {
//                                                         setState(() {
//                                                           obscurePassword =
//                                                           !obscurePassword;
//                                                         });
//                                                       },
//                                                       icon: Icon(obscurePassword
//                                                           ? Icons.visibility
//                                                           : Icons.visibility_off),
//                                                     ),
//                                                     hintText: 'Enter your password',
//                                                   ),
//                                                   validator: (value) {
//                                                     if (value == null ||
//                                                         value.isEmpty) {
//                                                       return 'Please enter your password';
//                                                     }
//                                                     // Additional password validation can be added here if needed
//                                                     return null;
//                                                   },
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                         children: [
//                                           TextButton(
//                                             onPressed: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         ForgotPassword(),
//                                                   ));
//                                             },
//                                             child: Text('Forgot password'),
//                                           ),
//                                           ElevatedButton(
//                                             style: ButtonStyle(
//                                               fixedSize: MaterialStateProperty.all(
//                                                   Size(100, 40)),
//                                               backgroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.blue),
//                                             ),
//                                             onPressed: () {
//                                               if (loginKey.currentState!.validate()) {
//                                                 Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           ProductList(),
//                                                     ));
//                                               }
//                                             },
//                                             child: Text('Login'),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(30),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             'Do not have an account?',
//                                           ),
//                                           TextButton(
//                                             onPressed: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (context) => New(),
//                                                   ));
//                                             },
//                                             child: Text('Register'),
//
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     IconButton(onPressed: () {
//                                       setState(() {
//                                         _googleSignInController.signInWithGoogle();                                });
//                                     }, icon: Image(image: AssetImage('assets/images/google.jpg')))
//
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               } else {
//                 // Return your actual content once the delay is over
//                 return ListView(
//                   children: [
//                     Stack(
//                       children: [
//                         SizedBox(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               const SizedBox(
//                                 child: Image(
//                                     image: AssetImage('assets/images/img16.jpg')),
//                               ),
//                               Container(
//                                 height: 650,
//                                 width: size.width,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(45),
//                                     topLeft: Radius.circular(45),
//                                   ),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     const Padding(
//                                       padding: EdgeInsets.only(top: 20),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                             EdgeInsets.only(left: 15, bottom: 40),
//                                             child: Text(
//                                               'Welcome back!',
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 30,
//                                                 fontWeight: FontWeight.w900,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding:
//                                       const EdgeInsets.only(left: 18, right: 18),
//                                       child: Container(
//                                         height: 280,
//                                         decoration: BoxDecoration(
//                                           gradient: const LinearGradient(
//                                             colors: [
//                                               Colors.white24,
//                                               Colors.white38,
//                                               Colors.blueGrey,
//                                             ],
//                                           ),
//                                           boxShadow: const [
//                                             BoxShadow(
//                                               blurRadius: 2,
//                                               color: Colors.black12,
//                                             ),
//                                           ],
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.circular(15),
//                                         ),
//                                         child: SingleChildScrollView(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                             children: [
//                                               const Padding(
//                                                 padding: EdgeInsets.all(11.0),
//                                                 child: Center(
//                                                   child: Text(
//                                                     'Login',
//                                                     style: TextStyle(
//                                                       fontWeight: FontWeight.w900,
//                                                       fontSize: 30,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               const Padding(
//                                                 padding: EdgeInsets.only(left: 20),
//                                                 child: Text(
//                                                   'Email',
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 16,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 19, right: 19),
//                                                 child: TextFormField(
//                                                   controller: emailController,
//                                                   validator: (value) {
//                                                     if (value == null ||
//                                                         value.isEmpty) {
//                                                       return 'Please enter your email';
//                                                     }
//                                                     if (!RegExp(
//                                                         r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
//                                                         .hasMatch(value)) {
//                                                       return 'Enter a valid email address';
//                                                     }
//                                                     return null;
//                                                   },
//                                                   decoration: const InputDecoration(
//                                                     prefixIcon: Icon(
//                                                         Icons.attach_email_outlined),
//                                                     hintText: 'Enter your email',
//                                                   ),
//                                                 ),
//                                               ),
//                                               const Padding(
//                                                 padding: EdgeInsets.only(
//                                                     left: 20, top: 20),
//                                                 child: Text(
//                                                   'Password',
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 16,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 19, right: 19),
//                                                 child: TextFormField(
//                                                   controller: passwordController,
//                                                   obscureText: obscurePassword,
//                                                   decoration: InputDecoration(
//                                                     prefixIcon:
//                                                     Icon(Icons.lock_clock),
//                                                     suffixIcon: IconButton(
//                                                       onPressed: () {
//                                                         setState(() {
//                                                           obscurePassword =
//                                                           !obscurePassword;
//                                                         });
//                                                       },
//                                                       icon: Icon(obscurePassword
//                                                           ? Icons.visibility
//                                                           : Icons.visibility_off),
//                                                     ),
//                                                     hintText: 'Enter your password',
//                                                   ),
//                                                   validator: (value) {
//                                                     if (value == null ||
//                                                         value.isEmpty) {
//                                                       return 'Please enter your password';
//                                                     }
//                                                     // Additional password validation can be added here if needed
//                                                     return null;
//                                                   },
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                         children: [
//                                           TextButton(
//                                             onPressed: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         ForgotPassword(),
//                                                   ));
//                                             },
//                                             child: Text('Forgot password'),
//                                           ),
//                                           ElevatedButton(
//                                             style: ButtonStyle(
//                                               fixedSize: MaterialStateProperty.all(
//                                                   Size(100, 40)),
//                                               backgroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.blue),
//                                             ),
//                                             onPressed: () {
//                                               if (loginKey.currentState!.validate()) {
//                                                 Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           ProductList(),
//                                                     ));
//                                               }
//                                             },
//                                             child: Text('Login'),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(30),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             'Do not have an account?',
//                                           ),
//                                           TextButton(
//                                             onPressed: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (context) => New(),
//                                                   ));
//                                             },
//                                             child: Text('Register'),
//
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     IconButton(onPressed: () {
//                                       setState(() {
//                                         _googleSignInController.signInWithGoogle();                                });
//                                     }, icon: Image(image: AssetImage('assets/images/google.jpg')))
//
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_choice_flutter/view/forgot_password_view.dart';
import 'package:second_choice_flutter/views/widgets/home_page.dart';
import 'package:second_choice_flutter/views/widgets/registration_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/email_password_controller.dart';
import '../../controller/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _BridgeState();
}

var emailController = TextEditingController();
var passwordController = TextEditingController();
bool passVisible = false;

class _BridgeState extends State<Login> {

  final loginKey = GlobalKey<FormState>();

  final EmailPassController _emailPassController =
  Get.put(EmailPassController());
  final GoogleSignInController _googleSignInController =
  Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginKey,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 1)),
            // Add delay here
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Return the shimmer effect while waiting
                return Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade300,
                  child: ListView(
                    children: [
                      const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Bridge Events",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.w900)),
                          )),
                      const Center(
                          child: Image(
                            image: AssetImage('assets/images/loginorg.png'),
                            // height: 400,
                            // width: 400,
                          )),
                      const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'welcome Back!',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )),
                      const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                                "welcome back to the best. we're\n always here, waiting for you!",
                                style: TextStyle(wordSpacing: 2, fontSize: 16),
                                textAlign: TextAlign.center),
                          )),
                      Padding(
                        padding:
                        const EdgeInsets.only(right: 50, left: 50, top: 15),
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.white38),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                hintText: " Email",
                                hintStyle: TextStyle(color: Colors.black),
                                // labelText: ' Email',
                                // labelStyle: TextStyle(color: Colors.black),
                                suffixIcon:
                                Icon(Icons.alternate_email, size: 15),
                                filled: true,
                                fillColor: Color.fromARGB(129, 129, 129, 129)),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ("Please enter your email");
                              }
                              if (!RegExp(
                                  r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(value)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(right: 50, left: 50, top: 25),
                        child: TextFormField(
                            maxLength: 12,
                            decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.white38),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                hintText: " Password",
                                hintStyle: TextStyle(color: Colors.black),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        passVisible = !passVisible;
                                      });
                                    },
                                    icon: Icon(passVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    iconSize: 17),
                                filled: true,
                                fillColor: Color.fromARGB(129, 129, 129, 129)),
                            controller: passwordController,
                            obscureText: !passVisible,
                            obscuringCharacter: "*",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ("Please enter your password");
                              }
                              if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$')
                                  .hasMatch(value)) {
                                return "Enter valid password";
                              }
                              return null;
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const ForgotPassword();
                                    },
                                  ));
                                });
                              },
                              child: const Text(
                                "Forgot Password",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: 40,
                              width: 70,
                              decoration: const BoxDecoration(
                                  color: (Colors.black),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                              child: TextButton(
                                  onPressed: () async {
                                    if (loginKey.currentState!.validate()) {
                                      _emailPassController.updateLoading();
                                      try {
                                        UserCredential? userCredential =
                                        await _emailPassController
                                            .signinUser(
                                          emailController.text,
                                          passwordController.text,
                                        );
                                        if (userCredential!
                                            .user!.emailVerified) {
                                          final user = userCredential.user;
                                          Get.off(() => const ProductList(),
                                              transition: Transition
                                                  .leftToRightWithFade);
                                        }
                                      } catch (e) {
                                        print(e);
                                      } finally {
                                        _emailPassController.updateLoading();
                                      }
                                    }
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Not have an account?"),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return Register();
                                    },
                                  ));
                                });
                              },
                              child: const Text(
                                "Sign Up? ",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                // Return your actual content once the delay is over
                return ListView(
                  children: [
                    const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Bridge Events",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w900)),
                        )),
                    const Center(
                        child: Image(
                          image: AssetImage('assets/images/loginorg.png'),
                          // height: 400,
                          // width: 400,
                        )),
                    const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'welcome Back!',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )),
                    const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                              "welcome back to the best. we're\n always here, waiting for you!",
                              style: TextStyle(wordSpacing: 2, fontSize: 16),
                              textAlign: TextAlign.center),
                        )),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 50, left: 50, top: 15),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white38),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              hintText: " Email",
                              hintStyle: TextStyle(color: Colors.black),
                              // labelText: ' Email',
                              // labelStyle: TextStyle(color: Colors.black),
                              suffixIcon: Icon(Icons.alternate_email, size: 15),
                              filled: true,
                              fillColor: Color.fromARGB(129, 129, 129, 129)),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ("Please enter your email");
                            }
                            if (!RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(value)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          }),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 50, left: 50, top: 25),
                      child: TextFormField(
                          maxLength: 12,
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white38),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              hintText: " Password",
                              hintStyle: TextStyle(color: Colors.black),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passVisible = !passVisible;
                                    });
                                  },
                                  icon: Icon(passVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  iconSize: 17),
                              filled: true,
                              fillColor: Color.fromARGB(129, 129, 129, 129)),
                          controller: passwordController,
                          obscureText: !passVisible,
                          obscuringCharacter: "*",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ("Please enter your password");
                            }
                            if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$')
                                .hasMatch(value)) {
                              return "Enter valid password";
                            }
                            return null;
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // IconButtonWidget(buttonText: "Hello btn", iconData: Icons.add, onPressed: () {
                        //
                        // }, trailingIcon: Icons.wifi),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const ForgotPassword();
                                  },
                                ));
                              });
                            },
                            child: const Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 40,
                            width: 70,
                            decoration: const BoxDecoration(
                                color: (Colors.black),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                                onPressed: () {
                                  if (loginKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("success")));
                                    setState(() {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return ProductList();
                                        },
                                      ));
                                    });
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                            height: 40,
                            width: 40,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _googleSignInController.signInWithGoogle();

                                  });

                                },
                                icon: const Image(
                                    image: AssetImage(
                                      'assets/images/google.png',
                                    ))),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not have an account?"),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Register();
                                  },
                                ));
                              });
                            },
                            child: const Text(
                              "Sign Up? ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}