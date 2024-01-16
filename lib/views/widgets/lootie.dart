import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success Animation'),
      ),
      body: Center(
        child: Lottie.asset(
          'assets/json/success.json', // Replace with your animation file
          width: 200,
          height: 150,
          repeat: true, // Set to true if you want to loop the animation
          reverse: false, // Set to true if you want to play the animation in reverse
          animate: true,
        ),
      ),
    );
  }
}
