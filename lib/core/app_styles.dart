// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle textWelcome = const TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w900,
    fontSize: 45,
  );

  static InputDecoration textInput = const InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Type your message here...',
  );

  static BoxDecoration loginDecoration = BoxDecoration(
    // gradient: AppColors.loginGradient,
    color: Colors.lightBlueAccent,
    borderRadius: BorderRadius.circular(30.0),
    boxShadow: const [
      BoxShadow(
        color: Colors.black38,
        offset: Offset(4, 4),
        blurRadius: 6,
      ),
    ],
  );

  static BoxDecoration registerDecoration = BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(30.0),
    boxShadow: const [
      BoxShadow(
        color: Colors.black38,
        offset: Offset(4, 4),
        blurRadius: 6,
      ),
    ],
  );

  static InputDecoration input = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: "Enter your messege...",
    hintStyle: TextStyle(color: Colors.blueAccent),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}
