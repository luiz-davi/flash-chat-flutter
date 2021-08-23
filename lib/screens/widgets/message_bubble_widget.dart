import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String textMessage;
  final String sender;
  final bool isLoggedUser;

  const MessageBubble({
    Key? key,
    required this.textMessage,
    required this.sender,
    required this.isLoggedUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment:
            isLoggedUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
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
            borderRadius: isLoggedUser
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
            elevation: 5,
            color: isLoggedUser ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                textMessage,
                style: TextStyle(
                  fontSize: 20,
                  color: isLoggedUser ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
