import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:second_choice_flutter/views/widgets/home_page.dart';
import 'package:second_choice_flutter/views/widgets/wellcome_page.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      logInCheck(context);
    });
  }

  Future<void> logInCheck(BuildContext context) async {
    if (user != null) {
      Get.offAll(() => const ProductList(),
          transition: Transition.leftToRightWithFade);
    } else {
      Get.to(() => const WelcomeScreen(),
          transition: Transition.leftToRightWithFade);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        extendBodyBehindAppBar: true,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: 227,
                          height: 49.48,
                          child:Icon(Icons.thumb_up_alt_outlined)),
                    ),
                  )),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 20.0),
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(
                    height: 22,
                    width: 22,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}