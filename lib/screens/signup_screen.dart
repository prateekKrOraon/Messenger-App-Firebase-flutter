import 'package:flutter/material.dart';
import 'package:messenger_app/screens/login_screen.dart';
import 'package:messenger_app/utilities/custom_widgtes.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'signup_screen';

  @override
  _SignUpScreenState createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen>{

  String nickname;
  String phoneNo;
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
              padding: const EdgeInsets.all(50.0),
              child: Hero(
                tag: 'logo',
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.lightBlue,
                  size: 150.0,
                ),
              ),
            ),
            InputTextField(
              icon: Icons.tag_faces,
              labelText: "Nickname",
              onChanged: (String value){
                nickname = value;
              },
            ),
            InputTextField(
              icon: Icons.phone,
              labelText: "Phone Number",
              onChanged: (String value){
                phoneNo = value;
              },
            ),
            InputTextField(
              icon: Icons.lock_outline,
              labelText: "Password",
              onChanged: (String value){
                phoneNo = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: 80.0
              ),
              child: Hero(
                tag: 'signup_button',
                child: DefaultRaisedButton(
                  text: "Sign Up",
                  onPressed: (){

                  },
                ),
              ),
            ),
            Footer(
              text: "Already a member?",
              linkText: "Log In",
              onPressed: (){
                Navigator.pushReplacementNamed(context, LoginScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }

}