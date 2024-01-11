import 'package:flutter/material.dart';


import 'package:get/route_manager.dart';
import 'package:second_choice_flutter/views/widgets/registration_view.dart';

import 'login_page.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(children: [
            Expanded(
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: Image(image: AssetImage('assets/images/google.jpg'),)
                  ),
                )),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 20.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 343,
                      child: Text(
                        'GET & RIDE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFFFD771),
                          fontSize: 32,
                          fontFamily: 'Roboto-Bold',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 323,
                      child: Text(
                        'Wheels that you want',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Roboto-Regular',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 135,
                          height: 38,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                 Colors.blue
                                ),
                                overlayColor: MaterialStateProperty.all(
                                   Colors.black),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(9))),
                              ),
                              onPressed: () {
                                Get.offAll(() => const SignIn(),
                                    transition: Transition.leftToRightWithFade);
                              },
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Bold',
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 135,
                          height: 38,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                Colors.blue,
                                ),
                                overlayColor: MaterialStateProperty.all(
                                   Colors.black),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(9))),
                              ),
                              onPressed: () {
                                Get.offAll(() => const SignUp(),
                                    transition: Transition.leftToRightWithFade);
                              },
                              child: Text(
                                'Register',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Bold',
                                ),
                              )),
                        )
                      ],
                    )
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}