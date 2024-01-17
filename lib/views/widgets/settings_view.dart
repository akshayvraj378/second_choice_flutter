// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:second_choice_flutter/views/widgets/wellcome_page.dart';
//
//
// class SettingsPage extends StatefulWidget {
//    const SettingsPage({super.key});
//
//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//
//
//   bool SwitchOn = false;
//   bool SwitchOnn = false;
//
//   // List of items in our dropdown menu
//   var items = [
//     'English',
//     'Malayalam',
//     'Spanish',
//     'Hindi',
//     'Tamil',
//   ];
//   String Laqn = 'Language';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.black54,
//           title: const Text('Settings')),
//       body: ListView(
//           children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 25,right: 8,left: 8,bottom: 8),
//               child: ListTile(
//                 tileColor: Colors.lightBlue[50],
//                 leading: const Icon(Icons.language_outlined),
//                 title: Text(Laqn),
//                 trailing: DropdownButton(
//                   borderRadius: BorderRadius.circular(27),
//                   icon: const Text(('Select')),
//                   items: items.map((String items) {
//                     return DropdownMenuItem(
//                       value: items,
//                       child: Text(items),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       Laqn = newValue!;
//                     });
//                   },
//                 ),
//                 shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(onTap: () async{
//                 GoogleSignIn googleSignIn = GoogleSignIn();
//                 FirebaseAuth auth = FirebaseAuth.instance;
//                 await auth.signOut();
//                 await googleSignIn.signOut();
//                 Get.offAll(() => const WelcomeScreen());
//               },
//                 tileColor: Colors.lightBlue[100],
//                 shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 leading: const Icon(Icons.logout_sharp),
//                 title: const Text('LogOut'),
//                 trailing: const Icon(Icons.navigate_next_rounded),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Divider(color: Colors.white),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(bottom: 1, left: 8, top: 4, right: 8),
//               child: Text('Notification',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500)),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 child: Column(
//                   children: [
//                     Column(
//                       children: [
//                         ListTile(
//                           tileColor: Colors.green[50],
//                           shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(12),
//                                   topLeft: Radius.circular(12))),
//                           title: const Text('Notifications',
//                               style: TextStyle(color: Colors.black54)),
//                           trailing: Switch(
//                             activeColor: Colors.greenAccent,
//                             value: SwitchOn,
//                             onChanged: (value) {
//                               setState(() {
//                                 SwitchOn = !SwitchOn;
//                               });
//                             },
//                           ),
//                         ),
//                         ListTile(
//                           tileColor: Colors.green[100],
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(12),
//                                   bottomRight: Radius.circular(12))),
//                           leading: Text('App notifications',
//                               style: TextStyle(color: Colors.black54)),
//                           trailing: Switch(
//                             activeColor: Colors.greenAccent,
//                             value: SwitchOnn,
//                             onChanged: (value) {
//                               setState(() {
//                                 SwitchOnn = !SwitchOnn;
//                               });
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: Divider(color: Colors.white),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 1, left: 8, top: 4, right: 8),
//               child: Text(
//                 'Accounts',
//                 style: TextStyle(
//                     color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: SizedBox(
//                 child: Column(
//                   children: [
//                     ListTile(onTap: () {
//
//                     },
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(12),
//                               topRight: Radius.circular(12))),
//                       tileColor: Colors.grey[200],
//                       title: Text('Edit Profile'),
//                       trailing: Icon(Icons.navigate_next_outlined),
//                     ),
//                     ListTile(onTap: () {
//
//                     },
//                       tileColor: Colors.grey[300],
//                       title: Text('Change Password'),
//                       trailing: Icon(Icons.navigate_next_outlined),
//                     ),
//                     ListTile(onTap: () {
//
//                     },
//                       tileColor: Colors.grey[350],
//                       title: Text('Privacy & Social'),
//                       trailing: Icon(Icons.navigate_next_outlined),
//                     ),ListTile(onTap: () {
//
//                     },
//                       tileColor: Colors.grey[400],
//                       title: Text('Help & Service'),
//                       trailing: Icon(Icons.navigate_next_outlined),
//                     ),
//                     ListTile(onTap: () {
//
//                     },
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(12),
//                               bottomLeft: Radius.circular(12))),
//                       tileColor: Colors.grey,
//                       title: Text('About us'),
//                       trailing: Icon(Icons.navigate_next_outlined),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ]),]
//       ),
//     );
//   }
//
// }
//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:second_choice_flutter/views/widgets/wellcome_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool SwitchOn = false;
  bool SwitchOnn = false;
  List<String> items = [
    'English',
    'Malayalam',
    'Spanish',
    'Hindi',
    'Tamil',
  ];
  String Laqn = 'Language';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black54,
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 8, left: 8, bottom: 8),
            child: ListTile(
              tileColor: Colors.lightBlue[50],
              leading: const Icon(Icons.language_outlined),
              title: Text(Laqn),
              trailing: DropdownButton(
                borderRadius: BorderRadius.circular(27),
                icon: const Text(('Select')),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    Laqn = newValue!;
                  });
                },
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 8, left: 8, bottom: 8),
            child: ListTile(
              onTap: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                FirebaseAuth auth = FirebaseAuth.instance;
                await auth.signOut();
                await googleSignIn.signOut();
                Get.offAll(() => const WelcomeScreen());
              },
              tileColor: Colors.lightBlue[100],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              leading: const Icon(Icons.logout_sharp),
              title: const Text('LogOut'),
              trailing: const Icon(Icons.navigate_next_rounded),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(color: Colors.white),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 1, left: 8, top: 4, right: 8),
            child: Text('Notification',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Column(
                children: [
                  Column(
                    children: [
                      ListTile(
                        tileColor: Colors.green[50],
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12))),
                        title: const Text('Notifications',
                            style: TextStyle(color: Colors.black54)),
                        trailing: Switch(
                          activeColor: Colors.greenAccent,
                          value: SwitchOn,
                          onChanged: (value) {
                            setState(() {
                              SwitchOn = !SwitchOn;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.green[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12))),
                        leading: const Text('App notifications',
                            style: TextStyle(color: Colors.black54)),
                        trailing: Switch(
                          activeColor: Colors.greenAccent,
                          value: SwitchOnn,
                          onChanged: (value) {
                            setState(() {
                              SwitchOnn = !SwitchOnn;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Divider(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 1, left: 8, top: 4, right: 8),
            child: Text(
              'Accounts',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      // Handle onTap
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12))),
                    tileColor: Colors.grey[200],
                    title: Text('Edit Profile'),
                    trailing: Icon(Icons.navigate_next_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      // Handle onTap
                    },
                    tileColor: Colors.grey[300],
                    title: Text('Change Password'),
                    trailing: Icon(Icons.navigate_next_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      // Handle onTap
                    },
                    tileColor: Colors.grey[350],
                    title: Text('Privacy & Social'),
                    trailing: Icon(Icons.navigate_next_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      // Handle onTap
                    },
                    tileColor: Colors.grey[400],
                    title: Text('Help & Service'),
                    trailing: Icon(Icons.navigate_next_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      // Handle onTap
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12))),
                    tileColor: Colors.grey,
                    title: Text('About us'),
                    trailing: Icon(Icons.navigate_next_outlined),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
