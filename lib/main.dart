import 'package:firstapp/screens/description_screen.dart';
import 'package:firstapp/screens/home.dart';
import 'package:firstapp/screens/onboard_screen.dart';
import 'package:firstapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'screens/Homee.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash_screen(),
    );
  }
}

