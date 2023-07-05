import 'package:firstapp/screens/home.dart';
import 'package:firstapp/screens/intro_page1.dart';
import 'package:firstapp/screens/intro_page2.dart';
import 'package:firstapp/screens/intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            children: const [
              Intropage1(),
              Intropage2(),
              Intropage3(),
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
