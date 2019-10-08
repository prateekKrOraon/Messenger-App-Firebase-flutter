import 'package:flutter/material.dart';
import 'package:messenger_app/screens/signup_screen.dart';
import 'package:messenger_app/utilities/custom_widgtes.dart';

class LoginScreen extends StatefulWidget{
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }

}

class _LoginScreenState extends State<LoginScreen>{

  String userName;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.lightBlueAccent,
                        size: 150.0,
                      ),
                    ),
                  ],
                ),
            ),
            InputTextField(
              icon: Icons.phone,
              labelText: "Phone Number",
              onChanged: (String value){
                userName = value;
              },
            ),
            InputTextField(
              obscureText: true,
              icon: Icons.lock_outline,
              labelText: "Password",
              onChanged: (String value){
                password = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: 80.0,
              ),
              child: Hero(
                tag: 'login_button',
                child: DefaultRaisedButton(
                  text: "Log In",
                  onPressed: (){
                    //TODO: implement this
                  },
                ),
              ),
            ),
            Footer(
              text: "Not a member?",
              linkText: "Sign Up",
              onPressed: (){
                Navigator.pushReplacementNamed(context, SignUpScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }

}