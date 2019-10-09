import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:messenger_app/utilities/custom_widgtes.dart';

class ChatScreen extends StatefulWidget{

  static String id = "chat_screen";

  @override
  _ChatScreenState createState() {
    return _ChatScreenState();
  }

}

class _ChatScreenState extends State<ChatScreen>{

  final messageFieldController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser _loggedInUser;
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('messages').snapshots(),
            builder: (context,snapshot){
              if(!snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final messages = snapshot.data.documents.reversed;
              List<MessageBubble> messageBubbles = [];
              for(var message in messages){
                final messageText = message.data['text'];
                final messageSender = message.data['sender'];
                final timeStamp = message.data['time_stamp'];
                var currentUser = _loggedInUser.email;
                final messageBubble= MessageBubble(
                  sender: messageSender,
                  text: messageText,
                  timeStamp: timeStamp,
                  isLoggedInUser: currentUser == messageSender,
                );
                messageBubbles.add(messageBubble);
              }
              return Expanded(
                child: ListView(
                  reverse: true,
                  padding: EdgeInsets.all(10.0),
                  children: messageBubbles,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  MessageField(
                    onChanged: (String value){
                      messageText = value;
                    },
                    controller: messageFieldController,
                  ),
                  IconButton(
                    icon: Icon(Icons.send,
                      size: 35.0,),
                    color: Colors.white,
                    onPressed: (){
                      if(messageText != null) {
                        messageFieldController.clear();
                        var timeStamp = Timestamp.now();
                        _firestore.collection('messages').document("${timeStamp.microsecondsSinceEpoch}").setData({
                          'text': messageText,
                          'sender': _loggedInUser.email,
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

