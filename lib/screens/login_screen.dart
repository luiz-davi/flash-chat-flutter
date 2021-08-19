// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/core/app_styles.dart';
import 'package:flash_chat/screens/widgets/button_navigator.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/loginscren';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'ray',
                child: Container(
                  height: 200,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.amber),
                onChanged: (value) {
                  email = value;
                },
                decoration: AppStyles.input.copyWith(
                  hintText: "Enter your email...",
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.amber),
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: AppStyles.input.copyWith(
                  hintText: "Enter your password...",
                ),
              ),
              const SizedBox(height: 50),
              ButtonNavigator(
                title: "Log In",
                decorated: AppStyles.loginDecoration,
                action: () async {
                  // setState(() {
                  //   showSpinner = true;
                  // });
                  try {
                    FirebaseUser newUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.popAndPushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                  // setState(() {
                  //   showSpinner = false;
                  // });
                },
              ),
            ],
          ),
        ),
    );
  }
}
