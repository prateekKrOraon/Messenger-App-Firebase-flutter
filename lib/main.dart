import 'package:flutter/material.dart';
import 'package:messenger_app/screens/login_screen.dart';
import 'package:messenger_app/screens/signup_screen.dart';
import 'package:messenger_app/screens/welcome_screen.dart';

void main() => runApp(MessengerApp());

class MessengerApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Messenger",
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.blue,
        primaryColor: Colors.blueGrey[700],
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
      },
    );
  }
}

