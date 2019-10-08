import 'package:flutter/material.dart';
import 'package:messenger_app/screens/login_screen.dart';
import 'package:messenger_app/screens/signup_screen.dart';
import 'package:messenger_app/utilities/custom_widgtes.dart';

class WelcomeScreen extends StatefulWidget{

  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.lightBlue,
                    size: 150.0,
                  ),
                ),
                Text(
                  "Messenger",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Sacramento',
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 80.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'signup_button',
                    child: DefaultRaisedButton(
                      text: "Sign Up",
                      onPressed: (){
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Hero(
                    tag: 'login_button',
                    child: DefaultRaisedButton(
                      text: "Log In",
                      onPressed: (){
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
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