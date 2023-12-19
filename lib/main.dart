import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_choice_flutter/view/registration_view.dart';

import 'package:firebase_core/firebase_core.dart';

import 'fire/page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
home: FirestoreView(),
    );
  }
}

