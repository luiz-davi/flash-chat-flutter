// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/core/app_styles.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String id = '/chatScreen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  late String messageText;
  late FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentuser();
    getMesseges();
  }

  void messagesStream() async {
    _firestore.collection("messages").snapshots();
  }

  void getMesseges() async {
    await _firestore.collection("messages").getDocuments().then((value) => {
          value.documents.forEach((element) => {print(element.data)})
        });
  }

  void getCurrentuser() async{
    try {
      // ignore: unused_local_variable
      loggedInUser = await _auth.currentUser();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection("messeges").snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messeges = snapshot.data!.documents;
                        List<Text> messegeWidget = [];
                        for (var messege in messeges) {
                          final messegeText = messege.data['text'];
                        }
                      }
                      return Container();
                    },
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.amber),
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: AppStyles.input.copyWith(
                        hintText: "Type your message here...",
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      _firestore.collection("messages").add({
                        "text": messageText,
                        "sender": loggedInUser.email,
                      });
                    },
                    child: const Text(
                      'Send',
                      // style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
