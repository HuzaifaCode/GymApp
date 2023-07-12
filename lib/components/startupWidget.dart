import 'package:firstapp/components/container.dart';
import 'package:flutter/material.dart';

import 'elevatedloginButton.dart';

class startupWidget extends StatelessWidget {
  const startupWidget({
  super.key,
  required this.imagePath,
  required this.headingText,
  required this.paragraphText,
  required this.leftPress,
  required this.leftButtonText,
  required this.rightPress,
  required this.rightButtonText,
  });

  final String imagePath;
  final String headingText;
  final String paragraphText;
  final VoidCallback leftPress;
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback rightPress;

  //
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ContainerWidget(
          image: imagePath,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    headingText,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              Text(
                paragraphText,
                textAlign: TextAlign.start,
                style: const TextStyle(
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
                    onpressed: () {
                      if (leftPress != null) {
                        leftPress; // Call the callback function
                      };
                    },
                    background_Color: Colors.deepPurpleAccent,
                    Elevation: 12,
                    fontcolor: Colors.white,
                    shadowcolor: Colors.black,
                    text: leftButtonText,
                    kRegularPadding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  elevatedbuttonLWidget(
                    onpressed: () => rightPress(),
                    background_Color: Colors.white,
                    Elevation: 12,
                    shadowcolor: Colors.black,
                    text: rightButtonText,
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
    );
  }
}
