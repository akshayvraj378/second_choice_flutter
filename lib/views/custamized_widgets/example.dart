import 'package:flutter/material.dart';

class Myd extends StatefulWidget {
  const Myd({super.key});

  @override
  State<Myd> createState() => _MydState();
}

class _MydState extends State<Myd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}
