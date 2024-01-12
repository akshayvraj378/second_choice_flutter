import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:second_choice_flutter/views/widgets/home_page.dart';

import '../../controller/getuserdata.dart';
import '../widgets/Fav_page.dart';
import '../widgets/settings_view.dart';
import '../widgets/wellcome_page.dart';


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final GetUserDataController _getUserDataController =
  Get.put(GetUserDataController());
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(20.0),
          bottomRight: const Radius.circular(20.0),
        ),
      ),
      child: Wrap(
        runSpacing: 10,
        children: [
          FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
            future: _getUserDataController.getUserData(user!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Return a loading indicator or placeholder widget
                return SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(child: const CupertinoActivityIndicator()));
              } else if (snapshot.hasError) {
                // Handle error
                return Text('Error: ${snapshot.error}');
              } else {
                // Data has been loaded successfully
                List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;

                // Rest of your widget tree using the 'data'

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      "${data.isNotEmpty ? data[0]['username'] : 'N/A'}",
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Roboto-Regular',
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      "${data.isNotEmpty ? data[0]['email'] : 'N/A'}",
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Roboto-Regular',
                          fontSize: 10),
                    ),
                    leading: CircleAvatar(
                        radius: 22.0,
                        backgroundColor: Colors.blue,
                        child: Image.network("${data[0]['userImg']}")),
                  ),
                );
              }
            },
          ),
          Divider(
            indent: 10.0,
            endIndent: 10.0,
            thickness: 1.5,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProductList(),));
              },
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "Home",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: const Text(
                "Settings",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.settings,
                color: Colors.green,
              ),
              trailing: Icon(
                Icons.arrow_forward,

              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Seti(),));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "Favourate",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.orange,
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.orange,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FavPage(),));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Contact Us"),
                  content: Text("Phone Number: 9744151527"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
            },
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "Contact",

              ),
              leading: Icon(
                Icons.help,

              ),
              trailing: Icon(
                Icons.arrow_forward,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              onTap: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                FirebaseAuth _auth = FirebaseAuth.instance;
                await _auth.signOut();
                await googleSignIn.signOut();
                Get.offAll(() => WelcomeScreen());
              },
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.green),
              ),
              leading: Icon(
                Icons.logout,

              ),
              trailing: Icon(
                Icons.arrow_forward,

              ),
            ),
          ),
        ],
      ),

    );
  }
}
