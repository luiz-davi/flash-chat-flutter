import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';

class AppNavigator {
  static void navLogin(BuildContext context) {
    
  }

  static navRegister(BuildContext context) {
    Navigator.pushNamed(context, RegistrationScreen.id);
  }
}
