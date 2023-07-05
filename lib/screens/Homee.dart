import 'package:firstapp/screens/home.dart';
import 'package:firstapp/screens/login.dart';
import 'package:firstapp/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int selected = 0;
  final List<Widget> screenlist = <Widget>[
    const Homepage(),
    const LoginScreen(),
    const SignUp(),
  ];

  void onTap(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset:false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onTap(0);
        },
        backgroundColor: selected == 0 ? Colors.blueAccent : Colors.grey,
        child: const Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: screenlist.elementAt(selected),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffF2F3F7),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                onTap(1);
              },
              child: Ink(
                height: screenHeight*0.07,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color:
                            selected == 1 ? Colors.blueAccent : Color(0XffA4ADBC),
                      ),
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selected == 1
                            ? Colors.blueAccent : Color(0XffA4ADBC),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onTap(2);
              },
              child: Ink(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.account_balance_outlined,
                      color:
                          selected == 2 ? Colors.blueAccent : Color(0XffA4ADBC),
                    ),
                    Text(
                      "SignUp",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selected == 2
                            ? Colors.blueAccent
                            : Color(0XffA4ADBC),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
