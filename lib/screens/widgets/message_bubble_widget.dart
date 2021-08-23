import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Color? colorBubble;
  final Color? colorText;
  final CrossAxisAlignment alignmentMesseg;
  final String textMessage;
  final String sender;

  const MessageBubble({
    Key? key,
    required this.textMessage,
    required this.sender,
    this.colorBubble = Colors.lightBlueAccent,
    this.colorText = Colors.white,
    this.alignmentMesseg = CrossAxisAlignment.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: alignmentMesseg,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Material(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            elevation: 5,
            color: colorBubble,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                textMessage,
                style: TextStyle(
                  fontSize: 20,
                  color: colorText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
