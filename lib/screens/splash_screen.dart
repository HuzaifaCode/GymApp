import 'package:firstapp/screens/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BoardingScreen(),
          // builder: (context) => const description_screen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                width: 180,
                height: 200,
                color: Colors.white,
                image: AssetImage(
                  "assets/images/logo.png",
                ),
              ),
            ),
            Text(
              "GYM",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.1,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
