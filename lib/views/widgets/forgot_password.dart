import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:second_choice_flutter/views/widgets/wellcome_page.dart';

import '../../controller/email_password_controller.dart';



class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _forgotPasswordController =
  TextEditingController();
  final EmailPassController _emailPassController =
  Get.put(EmailPassController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
backgroundColor: Colors.black,
        appBar: AppBar(

          leading: IconButton(
              onPressed: () => Get.offAll(() => const WelcomeScreen(),
                  transition: Transition.leftToRightWithFade),
              icon: const Icon(CupertinoIcons.back, color: Colors.white)),
          centerTitle: true,
          title: Text("Forgot Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Roboto-Bold',
              )),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.center,
          width: Get.width,
          height: Get.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              errorStyle: const TextStyle(
                                color: Colors.yellow,
                                fontSize: null,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.transparent),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              filled: true,
                              fillColor: const Color(0xFFF1F4FF),
                              hintText: "Enter your email",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Roboto-Regular',
                                fontSize: 15,
                                height: 0,
                              )),
                          controller: _forgotPasswordController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                           Colors.blue,
                          ),
                          overlayColor:
                          MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9))),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String email = _forgotPasswordController.text.trim();
                            print(email);
                            if (email.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Please enter all details",
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else {
                              _emailPassController.forgotPassword(email);
                            }
                          }
                        },
                        child: Text('Rest password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Roboto-Bold',
                            )),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}