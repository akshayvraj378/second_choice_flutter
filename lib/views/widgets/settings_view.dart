import 'package:flutter/material.dart';

import '../../controller/getuserdata.dart';
import '../../controller/google_sign_in.dart';

class Seti extends StatefulWidget {
  const Seti({super.key});

  @override
  State<Seti> createState() => _SetiState();
}

class _SetiState extends State<Seti> {

  bool SwitchOn = false;
  bool SwitchOnn = false;

  // List of items in our dropdown menu
  var items = [
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
          title: Text('Settings')),
      body: ListView(
          children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 25,right: 8,left: 8,bottom: 8),
              child: ListTile(
                tileColor: Colors.lightBlue[50],
                leading: Icon(Icons.language_outlined),
                title: Text('$Laqn'),
                trailing: DropdownButton(
                  borderRadius: BorderRadius.circular(27),
                  //  value: dropdownvalue,
                  icon: const Text(('Select')),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      //      dropdownvalue = newValue!;
                      Laqn = newValue!;
                    });
                  },
                ),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(onTap: () {

              },
                tileColor: Colors.lightBlue[100],
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                leading: Icon(Icons.logout_sharp),
                title: Text('LogOut'),
                trailing: Icon(Icons.navigate_next_rounded),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1, left: 8, top: 4, right: 8),
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12))),
                          title: Text('Notifications',
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
                          leading: Text('App notifications',
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
                    ListTile(onTap: () {

                    },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      tileColor: Colors.grey[200],
                      title: Text('Edit Profile'),
                      trailing: Icon(Icons.navigate_next_outlined),
                    ),
                    ListTile(onTap: () {

                    },
                      tileColor: Colors.grey[300],
                      title: Text('Change Password'),
                      trailing: Icon(Icons.navigate_next_outlined),
                    ),
                    ListTile(onTap: () {

                    },
                      tileColor: Colors.grey[350],
                      title: Text('Privacy & Social'),
                      trailing: Icon(Icons.navigate_next_outlined),
                    ),ListTile(onTap: () {

                    },
                      tileColor: Colors.grey[400],
                      title: Text('Help & Service'),
                      trailing: Icon(Icons.navigate_next_outlined),
                    ),
                    ListTile(onTap: () {

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
          ]),]
      ),
    );
  }
}
