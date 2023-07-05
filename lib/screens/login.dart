import 'package:firstapp/components/sizedbox.dart';
import 'package:firstapp/screens/Homee.dart';
import 'package:firstapp/screens/home.dart';
import 'package:firstapp/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visibility = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE8EBF5),
        appBar: AppBar(
          backgroundColor: const Color(0xffE8EBF5),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "Welcome to Login",
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 0.5,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 29),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: screenHeight * 0.31,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(40)),
                      image: DecorationImage(
                        image: AssetImage("assets/images/G1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Sizeddbox(),
                TextFieldWidget(
                  controller: _emailController,
                  prefixIcon: Icons.email,
                  hintText: "Email",
                  labelText: "Email",
                ),
                Sizeddbox(),
                TextFieldWidget(
                  controller: _passwordController,
                  prefixIcon: Icons.lock,
                  hintText: "Enter your Password",
                  labelText: "Password",
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        if (visibility) {
                          visibility = false;
                        } else {
                          visibility = true;
                        }
                      });
                    },
                    child: Icon(
                      visibility ? Icons.visibility : Icons.visibility_off,
                      color: visibility ? Colors.black : Colors.grey.shade400
                    ),
                  ),
                  obscure: visibility,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                ButtonWidget(
                  backgroundColor: Colors.black,
                  buttonTitle: 'Login',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const home(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUp(),
                        ),
                      ),
                      child: const Text(
                        "SignUp?",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
