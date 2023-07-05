import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  late String buttonTitle;
  late VoidCallback onPressed;
  Color? backgroundColor;

  ButtonWidget(
      {super.key,
        required this.buttonTitle,
        required this.onPressed,
        this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: screenHeight*0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(buttonTitle,style: TextStyle(letterSpacing: 1),),
      ),
    );
  }
}
