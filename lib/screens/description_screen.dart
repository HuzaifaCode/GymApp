import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class description_screen extends StatelessWidget {
  const description_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE8EBF5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage("assets/images/G7.jpg"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0,left: 15 ),
              child: Text("Daily Plan",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),
      ),
    );
  }
}
