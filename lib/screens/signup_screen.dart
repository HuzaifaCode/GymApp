import 'package:firstapp/screens/Homee.dart';
import 'package:firstapp/screens/home.dart';
import 'package:firstapp/screens/login.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/sizedbox.dart';
import '../components/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  bool visibility = false;

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _LnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _retypepasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE8EBF5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffE8EBF5),
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "SignUp",
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.1,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: [
                TextFieldWidget(
                  controller: _fnameController,
                  prefixIcon: Icons.person,
                  hintText: "Enter your First Name",
                  labelText: "First Name",
                ),
                Sizeddbox(),
                TextFieldWidget(
                  controller: _LnameController,
                  prefixIcon: Icons.person_2_outlined,
                  hintText: "Enter your Last Name",
                  labelText: "Last Name",
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
                        color:
                            visibility ? Colors.black : Colors.grey.shade400),
                  ),
                  obscure: visibility,
                ),
                Sizeddbox(),
                TextFieldWidget(
                  controller: _retypepasswordController,
                  prefixIcon: Icons.lock,
                  hintText: "Retype your Password",
                  labelText: "Retype password",
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
                      color: visibility ? Colors.black : Colors.grey.shade400,
                    ),
                  ),
                  obscure: visibility,
                ),
                Sizeddbox(),
                ButtonWidget(
                  backgroundColor: Colors.black,
                  buttonTitle: 'SignUp',
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
                      "Already have an account?",
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      ),
                      child: const Text(
                        "Login?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
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
