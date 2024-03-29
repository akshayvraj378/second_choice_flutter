import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:second_choice_flutter/views/widgets/sentotp.dart';
import 'package:second_choice_flutter/views/widgets/wellcome_page.dart';

import '../../controller/email_password_controller.dart';
import '../../controller/email_validation.dart';
import '../../controller/google_sign_in.dart';
import '../validator/validator.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());
  final EmailPassController _emailPassController =
      Get.put(EmailPassController());

  Widget getTextField(
      {required String hint,
      required var icons,
      bool obstxt = null ?? false,
      var suficons,
      required var validator,
      required var controller,
      required var keyboardType}) {
    return TextFormField(
      obscureText: obstxt,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suficons,
          errorStyle: const TextStyle(
            color: Colors.yellow,
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          prefixIcon: icons,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          filled: true,
          fillColor: const Color(0xFFF1F4FF),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black54,
            fontFamily: 'Roboto-Regular',
            fontSize: 15,
            height: 0,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.offAll(() => const WelcomeScreen(),
                  transition: Transition.leftToRightWithFade),
              icon: const Icon(CupertinoIcons.back, color: Colors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(children: [

              Container(
                margin: const EdgeInsets.only(top: 70.0),
                child: Column(children: [ Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Roboto-Bold',
                  ),
                ),

                ]),
              ),
              Expanded(
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: 323,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Lottie.asset(
                          'assets/json/register.json', // Replace with your animation file
                          width: double.infinity,
                          height: 180,
                          repeat: true, // Set to true if you want to loop the animation
                          reverse: false, // Set to true if you want to play the animation in reverse
                          animate: true,
                        ),SizedBox(height: 15,),
                          getTextField(
                              keyboardType: TextInputType.text,
                              hint: "Name",
                              icons: const Icon(Icons.person_outline),
                              validator: (value) => Validator.validateName(
                                    name: value,
                                  ),
                              controller: _nameTextController),
                          SizedBox(
                            height: 26,
                          ),
                          getTextField(
                              keyboardType: TextInputType.emailAddress,
                              hint: "Email",
                              icons: const Icon(Icons.email),
                              validator: (value) => Validator.validateEmail(
                                    email: value,
                                  ),
                              controller: _emailTextController),
                          SizedBox(
                            height: 26,
                          ),
                          Obx(() => getTextField(
                                obstxt:
                                    _emailPassController.passwordVisible.value,
                                suficons: IconButton(
                                  onPressed: () {
                                    _emailPassController
                                        .updateVisibility(); // Use the controller method to toggle visibility
                                  },
                                  icon: Icon(
                                      _emailPassController.passwordVisible.value
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                hint: "Password",
                                icons: const Icon(Icons.lock),
                                validator: (value) =>
                                    Validator.validatePassword(
                                  password: value,
                                ),
                                controller: _passwordTextController,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Obx(() => SizedBox(
                              width: 357,
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9))),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color(0xFF1F41BB))),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _emailPassController.updateLoading();
                                    try {
                                      await _emailPassController.signupUser(
                                        _emailTextController.text,
                                        _passwordTextController.text,
                                        _nameTextController.text,
                                      );
                                      if (_emailPassController.currentUser !=
                                          null) {
                                        Get.off(
                                            () => EmailValidationScreen(
                                                user: _emailPassController
                                                    .currentUser!),
                                            transition:
                                                Transition.leftToRightWithFade);
                                      } else {
                                        // No user is currently authenticated
                                        Get.snackbar('No user is',
                                            'currently authenticated');
                                      }
                                    } catch (e) {
                                      Get.snackbar('Error', e.toString());
                                    } finally {
                                      _emailPassController.updateLoading();
                                    }
                                  }
                                },
                                child: _emailPassController.loading.value
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        'Sign Up',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          height: 0,
                                          fontFamily: 'Roboto-Bold',
                                        ),
                                      ),
                              ))),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SignIn(),
                                        ),
                                        (route) => false);
                                  },
                                  child: Text('SignIn'))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 90.0),
                width: MediaQuery.of(context).size.width,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {
                      _googleSignInController.signInWithGoogle();
                    },
                    child: SizedBox(
                        width: 60,
                        height: 36,
                        child: Image(
                            image: AssetImage('assets/images/google.jpg'))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const SendOtp()),
                    child: SizedBox(
                        width: 60,
                        height: 36,
                        child:
                            Image(image: AssetImage('assets/images/phon.jpg'))),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
