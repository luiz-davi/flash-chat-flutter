// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, void_checks, avoid_print

import 'package:flash_chat/core/app_styles.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/widgets/button_navigator_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = '/';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    controller!.forward();

    controller!.addListener(() {
      setState(() {});
    });

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'ray',
                  child: Container(
                    height: 60,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: AppStyles.textWelcome,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Flash Chat',
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            ButtonNavigator(
              title: "Login",
              decorated: AppStyles.loginDecoration,
              action: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            SizedBox(height: 30),
            ButtonNavigator(
              title: "Register",
              decorated: AppStyles.registerDecoration,
              action: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
