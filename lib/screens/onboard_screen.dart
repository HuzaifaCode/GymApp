import 'package:firstapp/screens/login.dart';
import 'package:firstapp/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/startupWidget.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController _controller = PageController();
  bool lastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                lastpage = (index == 2);
              });
            },
            children:  [
              startupWidget(
                imagePath: "assets/images/G1.jpg",
                headingText: "SUPPLEMENTS",
                paragraphText:
                "I am going to do a workout daily to make me fit using this application",
                leftPress: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    )),
                leftButtonText: "Login",
                rightPress:() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignUp(),
                    )),
                rightButtonText: "SignUp",
              ),
              startupWidget(
                imagePath: "assets/images/G4.jpg",
                headingText: "SUPPLEMENTS",
                paragraphText:
                "I am going to do a workout daily to make me fit using this application",
                leftPress: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    )),
                leftButtonText: "Login",
                rightPress:() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignUp(),
                    )),
                rightButtonText: "SignUp",
              ),
              startupWidget(
                imagePath: "assets/images/G3.jpg",
                headingText: "SUPPLEMENTS",
                paragraphText:
                "I am going to do a workout daily to make me fit using this application",
                leftPress: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    )),
                leftButtonText: "Login",
                rightPress:() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignUp(),
                    )),
                rightButtonText: "SignUp",
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0,0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
