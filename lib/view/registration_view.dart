// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//
// import '../views/widgets/login_page.dart';
// import 'login_view.dart';
//
//
// class New extends StatefulWidget {
//   const New({super.key});
//
//   @override
//   State<New> createState() => _NewState();
// }
//
// class _NewState extends State<New> {
//   final loginkey = GlobalKey<FormState>();
//   bool pass = false;
//   String phoneNumber = '';
//   var passwordController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');
//   RegExp phoneRegExp =
//   RegExp(r'^(?:(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[6789]\d{9})$');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.black,
//       body: Form(
//           key: loginkey,
//           child: ListView(
//             children: [
//               Stack(
//                 children: [
//                   SizedBox(
//                     child: Column(
//                       children: [SizedBox(
//                         child: Image(image: AssetImage('assets/images/logoe.jpg')),),
//                         Container(
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(45),
//                               topLeft: Radius.circular(45),
//                             ),
//                           ),
//                           child: Column(children: [
//                             Padding(
//                               padding: const EdgeInsets.only(right: 19,left: 19,top: 30),
//                               child: Container(
//                                 height: 450,
//                                 decoration: BoxDecoration(gradient: const LinearGradient(
//                                   colors: [
//                                     Colors.white24,
//                                     Colors.white38,
//                                     Colors.blueGrey,
//                                   ],
//                                 ),
//                                     boxShadow: [
//                                       BoxShadow(blurRadius: 4, color: Colors.black26)
//                                     ],
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(15)),
//                                 child: ListView(children: [
//                                   Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Center(
//                                             child: Text('Register',
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w900,
//                                                     fontSize: 30)),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(left: 20),
//                                           child: Text('Name',
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 16)),
//                                         ),
//                                         Padding(
//                                           padding:
//                                           const EdgeInsets.only(left: 19, right: 19),
//                                           child: TextFormField(
//                                               validator: (value) {
//                                                 if (value == null || value.isEmpty) {
//                                                   return 'Please Enter Your Name';
//                                                 } else if (!nameRegExp.hasMatch(value)) {
//                                                   return 'Please Enter A Valid Name';
//                                                 }
//                                                 return null;
//                                               },
//                                               decoration: InputDecoration(
//                                                   hintText: 'Enter Your Name')),
//                                         ),
//                                         Padding(
//                                           padding:
//                                           const EdgeInsets.only(left: 20, top: 20),
//                                           child: Text('Phone Number',
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 16)),
//                                         ),
//                                         Padding(
//                                           padding:
//                                           const EdgeInsets.only(left: 20, right: 20),
//                                           child: IntlPhoneField(
//                                             decoration: InputDecoration(
//                                               labelText: 'Phone Number',
//                                             ),
//                                             initialCountryCode:
//                                             'IN', // Set initial country code
//                                             onChanged: (phone) {
//                                               setState(() {
//                                                 phoneNumber = phone.completeNumber;
//                                               });
//                                             },
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                             left: 20,
//                                           ),
//                                           child: Text('Email',
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 16)),
//                                         ),
//                                         Padding(
//                                           padding:
//                                           const EdgeInsets.only(left: 19, right: 19),
//                                           child: TextFormField(
//                                               validator: (value) {
//                                                 if (value == null || value.isEmpty) {
//                                                   return 'Please enter your email';
//                                                 }
//                                                 if (!RegExp(
//                                                     r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
//                                                     .hasMatch(value)) {
//                                                   return "Enter a valid email address";
//                                                 }
//                                                 return null;
//                                               },
//                                               decoration: InputDecoration(
//                                                   hintText: 'Enter your email')),
//                                         ),
//                                         Padding(
//                                           padding:
//                                           const EdgeInsets.only(left: 20, top: 20),
//                                           child: Text('Password',
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 16)),
//                                         ),
//                                         Padding(
//                                           padding:
//                                           const EdgeInsets.only(left: 19, right: 19),
//                                           child: TextFormField(
//                                             controller: passwordController,
//                                             obscureText: !pass,
//                                             decoration: InputDecoration(
//                                                 suffixIcon: IconButton(
//                                                   onPressed: () {
//                                                     setState(() {
//                                                       pass = !pass;
//                                                     });
//                                                   },
//                                                   icon: Icon(pass
//                                                       ? Icons.visibility
//                                                       : Icons.visibility_off),
//                                                 ),
//                                                 hintText: 'Enter your password'),
//                                             validator: (value) {
//                                               if (value == null || value.isEmpty) {
//                                                 return 'Please enter your password';
//                                               }
//                                               return null;
//                                             },
//                                           ),
//                                         ),
//                                       ]),
//                                 ]),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(15),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   ElevatedButton(
//                                       style: ButtonStyle(
//                                           fixedSize:
//                                           MaterialStatePropertyAll(Size(150, 40)),
//                                           backgroundColor:
//                                           MaterialStatePropertyAll(Colors.blue)),
//                                       onPressed: () {
//                                         loginkey.currentState!.validate();
//                                       },
//                                       child: Text('Register')),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(14),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text('Already have an account?'),
//                                       TextButton(
//                                           onPressed: () {
//                                             Navigator.pushAndRemoveUntil(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                   builder: (context) => const Login(),
//                                                 ),
//                                                     (route) => false);
//                                           },
//                                           child: Text('Login'))
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ]),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               )
//             ],
//           )),
//     );
//   }
// }
