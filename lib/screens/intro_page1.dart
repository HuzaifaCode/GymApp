import 'package:firstapp/components/container.dart';
import 'package:firstapp/screens/login.dart';
import 'package:flutter/material.dart';
import '../components/elevatedloginButton.dart';
import 'signup_screen.dart';

class Intropage1 extends StatefulWidget {
  const Intropage1({Key? key}) : super(key: key);

  @override
  State<Intropage1> createState() => _Intropage1State();
}

class _Intropage1State extends State<Intropage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ContainerWidget(
            image: "assets/images/G1.jpg",
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
                      onpressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      ),
                      background_Color: Colors.deepPurpleAccent,
                      Elevation: 12,
                      fontcolor: Colors.white,
                      shadowcolor: Colors.black,
                      text: "Login",
                      kRegularPadding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                    ),
                    elevatedbuttonLWidget(
                      onpressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUp(),
                        ),
                      ),
                      background_Color: Colors.white,
                      Elevation: 12,
                      shadowcolor: Colors.black,
                      text: "Sign up",
                      fontcolor: Colors.black,
                      kRegularPadding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
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
