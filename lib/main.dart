import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:second_choice_flutter/views/custamized_widgets/bottum.dart';
import 'package:second_choice_flutter/views/custamized_widgets/example.dart';
import 'package:second_choice_flutter/views/widgets/home_page.dart';
import 'package:second_choice_flutter/views/widgets/lootie.dart';
import 'package:second_choice_flutter/views/widgets/splashscreen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000);

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return   const GetMaterialApp(
      debugShowCheckedModeBanner: false,

       home: SplashScreen(),
    );
  }
}
