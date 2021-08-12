import 'package:flutter/material.dart';

class ButtonNavigator extends StatelessWidget {
  final String title;
  final BoxDecoration decorated;
  final void Function()? action;
  const ButtonNavigator({
    Key? key,
    required this.title,
    required this.decorated,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorated,
      child: TextButton(
        onPressed: action,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
