// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import 'message_bubble_widget.dart';

class StreamMessages extends StatelessWidget {
  final _firestore = Firestore.instance;
  StreamMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection("messages").snapshots(),
        builder: (context, snapshot) {
          List<MessageBubble> messegeWidgets = [];
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messeges = snapshot.data!.documents;
          for (var messege in messeges) {
            final textMessage = messege.data['text'];
            final sender = messege.data['sender'];

            if (loggedInUser.email == sender) {
              final messegeWidget = MessageBubble(
                textMessage: textMessage,
                sender: sender,
                isLoggedUser: loggedInUser.email == sender,
              );
              messegeWidgets.add(messegeWidget);
            } else {
              final messegeWidget = MessageBubble(
                textMessage: textMessage,
                sender: sender,
                isLoggedUser: loggedInUser.email == sender,
              );
              messegeWidgets.add(messegeWidget);
            }
          }
          return Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              children: messegeWidgets,
            ),
          );
        });
  }
}
