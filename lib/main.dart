import 'package:firebase_core/firebase_core.dart';
import 'package:firstapp/screens/admin_screen.dart';
import 'package:firstapp/screens/login.dart';
import 'package:firstapp/screens/number_screen.dart';
import 'package:firstapp/screens/signup_screen.dart';
import 'package:firstapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'screens/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    await FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: 'recaptcha-v3-site-key',
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.appAttest,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminScreen(),
    );
  }
}
