import 'package:firstapp/components/container.dart';
import 'package:flutter/material.dart';

import '../components/elevatedloginButton.dart';
import 'login.dart';
import 'signup_screen.dart';

class Intropage2 extends StatefulWidget {
  const Intropage2({Key? key}) : super(key: key);

  @override
  State<Intropage2> createState() => _Intropage2State();
}

class _Intropage2State extends State<Intropage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ContainerWidget(
            image: "assets/images/G4.jpg",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "SUPPLEMENTS",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  "I am going to do a workout daily to make me fit using this application",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    elevatedbuttonLWidget(
                      onpressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      ),
                      background_Color: Colors.deepPurpleAccent,
                      fontcolor: Colors.white,
                      text: "Login",
                      kRegularPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 17),
                    ),
                    elevatedbuttonLWidget(
                      onpressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUp(),
                        ),
                      ),
                      background_Color: Colors.white,
                      text: "Sign up",
                      fontcolor: Colors.black,
                      kRegularPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 17),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
