import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/screens/login.dart';
import 'package:firstapp/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/sizedbox.dart';
import '../components/textfield.dart';
import '../utils/toastMessages.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool visibility = false;
  bool isPress = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE8EBF5),
        appBar: AppBar(
          backgroundColor: const Color(0xffE8EBF5),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "Forget Password",
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
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,

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
                  SizedBox(height: screenHeight*0.14,),

                  TextFormFieldWidget(
                    controller: _emailController,
                    prefixIcon: Icons.email,
                    hintText: "Email",
                    labelText: "Email",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      } else if (!isEmailValid(value)) {
                        return 'Invalid Email Format';
                      }
                      return null; // Return null if the input is valid
                    },
                  ),
                  SizedBox(height: screenHeight*0.03,),
                  ButtonWidget(

                    backgroundColor: Colors.black,
                    buttonTitle: isPress? const CircularProgressIndicator(): const Text("Login"),
                    onPressed: () async {
                      setState(() {
                        isPress = true;
                      });
                      String email = _emailController.text.trim().toString();

                      if (email.isNotEmpty) {
                        if (!isEmailValid(email)) {
                          setState(() {
                            isPress = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Invalid Email Format"),
                            ),
                          );
                          return;
                        }

                        try {

                          await _auth.sendPasswordResetEmail(email: email);
                          showSnackBar("Check Your Email ", context);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));

                        } on FirebaseAuthException catch (e) {
                          print("Message: $e");
                          setState(() {
                            isPress=false;
                          });

                          if(e is FirebaseAuthException && e.code=="user-not-found") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("User not found, Please Register First"),
                              ),
                            );
                          }
                          else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Error, Something Wrong"),
                              ),
                            );
                          }

                        }
                      }
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
