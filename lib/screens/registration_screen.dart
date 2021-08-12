// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, unused_field, prefer_typing_uninitialized_variables

import 'package:flash_chat/core/app_styles.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/widgets/button_navigator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = '/registrationScreen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

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
              title: "Register",
              decorated: AppStyles.registerDecoration,
              action: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser.user != null) {
                    Navigator.popAndPushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
