import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_choice_flutter/views/widgets/wellcome_page.dart';

import '../../controller/otp_controller.dart';




class SendOtp extends StatefulWidget {
  const SendOtp({Key? key}) : super(key: key);

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  final SentOtpController _sentOtpController = Get.put(SentOtpController());
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(onPressed: () => Get.offAll(() => const WelcomeScreen(),
              transition: Transition.leftToRightWithFade), icon: Icon(CupertinoIcons.back,color: Colors.white)),
          centerTitle: true,

          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
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
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.transparent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.transparent),
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                                filled: true,
                                fillColor: const Color(0xFFF1F4FF),
                                hintText: "Enter your mobile number",
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Roboto-Regular',
                                  fontSize: 15,
                                  height: 0,
                                )),
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                             Colors.blue
                            ),
                            overlayColor: MaterialStateProperty.all(
                              Colors.green),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(9))),
                          ),
                          onPressed: () {
                            String phoneNumber = "+91" + _phoneNumberController.text.trim();
                            _sentOtpController.sendOtp(phoneNumber);
                          },
                          child: Text("Send OTP", style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Roboto-Bold',
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}