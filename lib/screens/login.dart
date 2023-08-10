import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstapp/components/sizedbox.dart';
import 'package:firstapp/screens/Homee.dart';
import 'package:firstapp/screens/admin_screen.dart';
import 'package:firstapp/screens/forget_password_screen.dart';
import 'package:firstapp/screens/home.dart';
import 'package:firstapp/screens/signup_screen.dart';
import 'package:firstapp/screens/splash_screen.dart';
import 'package:firstapp/services/AuthServices.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../components/button.dart';
import '../components/textfield.dart';
import '../utils/toastMessages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visibility = false;
  bool isPress = false;
  String imageUrl='';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  Sizeddbox(),
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
                  Sizeddbox(),
                  TextFormFieldWidget(
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
                          color:
                              visibility ? Colors.black : Colors.grey.shade400),
                    ),
                    obscure: visibility,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (!isPasswordValid(value)) {
                        return 'Password must contain at least 8 characters\nnone uppercase letter\none lowercase letter\none numeric digit\none special symbol';
                      }
                      return null; // Return null if the input is valid
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ForgetPasswordScreen()));
                        },
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  ButtonWidget(
                    backgroundColor: Colors.black,
                    buttonTitle: isPress
                        ? const CircularProgressIndicator()
                        : const Text("Login"),
                    onPressed: () async {
                      setState(() {
                        isPress = true;
                      });
                      String email = _emailController.text.trim().toString();
                      String password =
                          _passwordController.text.trim().toString();
                      if (email.isNotEmpty && password.isNotEmpty) {
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
                        if (!isPasswordValid(password)) {
                          setState(() {
                            isPress = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Password must be 8 cahraters long"),
                            ),
                          );
                          return;
                        }

                        try {
                          UserCredential userCredentials =
                              await _auth.signInWithEmailAndPassword(
                                  email: _emailController.text.trim().toString(),
                                  password: _passwordController.text.trim().toString());
                          User? user =  userCredentials.user;
                          if(user?.email=="admin@gmail.com"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const AdminScreen()));
                          }
                          else if (user != null) {
                            print("User Email :${user.email}");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const home(),
                              ),
                            );
                          }
                        } on FirebaseAuthException catch (e) {
                          print("Message: $e");
                          setState(() {
                            isPress = false;
                          });
                          if (e is FirebaseAuthException &&
                              e.code == "wrong-password") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Wrong Password, Try Other"),
                              ),
                            );
                          }
                          if (e is FirebaseAuthException &&
                              e.code == "user-not-found") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "User not found, Please Register First"),
                              ),
                            );
                          } else {
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
                  ),
                  ButtonWidget(
                      buttonTitle: const Text("Admin"),
                      backgroundColor: Colors.grey,
                      onPressed: ()async {
                        ImagePicker imagePicker= ImagePicker();
                        XFile? file =await imagePicker.pickImage(source: ImageSource.camera);
                        if(file==null) return;
                        String uniqueFileName=DateTime.now().microsecondsSinceEpoch.toString();
                        //step 2
                        Reference referenceRoot= FirebaseStorage.instance.ref();
                        Reference referenceImageDirectory=referenceRoot.child('images');

                        Reference imageToUpload=referenceImageDirectory.child(uniqueFileName);
                        try {
                          await imageToUpload.putFile(File(file!.path));
                          imageUrl= await imageToUpload.getDownloadURL();
                          print (imageUrl);
                          // AuthServices().uploadImage(imageUrl: imageUrl);
                        }
                        catch(e){

                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
