import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget{

  static String id = "chat_screen";

  @override
  _ChatScreenState createState() {
    return _ChatScreenState();
  }

}

class _ChatScreenState extends State<ChatScreen>{

  final _auth = FirebaseAuth.instance;
  FirebaseUser _loggedInUser;
  void getCurrentUser() async {
    final user = await _auth.currentUser();
    if(user != null){
      _loggedInUser = user;
      print(_loggedInUser.email);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
            "Messenger"
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Text(
          "Chat Screen",
          style: TextStyle(
            fontSize: 50.0,
          ),
        ),
      ),
    );
  }

}