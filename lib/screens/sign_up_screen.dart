import 'package:flutter/material.dart';
import 'package:todolise_app/components/my_button.dart';
import 'package:todolise_app/components/my_textfield.dart';
import 'package:todolise_app/constant/constant.dart';
import 'package:todolise_app/screens/sign_in_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final re_passwordController = TextEditingController();

  void signUp () async {
    //Add data to firebase on this Friday, so don't die n don't late
    try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, 
          password: passwordController.text, 
          );
          print("Created account!");
          
    } on FirebaseAuthException catch (e){
        print("Failed to create account");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 80, 15, 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to KMUTNB community',
                  style: textTitle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'To get started, please provide create an account.',
                  style: textSubTitle,
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                    controller: nameController,
                    hintText: 'Enter your name',
                    obscureText: false,
                    labelText: 'Name'),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    obscureText: false,
                    labelText: 'Email'),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                    labelText: 'Password'),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: re_passwordController,
                    hintText: 'Enter your password again',
                    obscureText: true,
                    labelText: 'Re-password'),
                const SizedBox(
                  height: 30,
                ),
                MyButton(onTap: signUp, hinText: 'Register now'),
                
                const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Have a member?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
