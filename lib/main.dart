import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:second_choice_flutter/views/widgets/camara.dart';
import 'package:second_choice_flutter/views/widgets/fav_page';
import 'package:second_choice_flutter/views/widgets/home_page.dart';
import 'package:second_choice_flutter/views/widgets/login_page.dart';
import 'package:second_choice_flutter/views/widgets/registration_view.dart';

import 'controller/email_validation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
        home: Register()
    );
  }
}
