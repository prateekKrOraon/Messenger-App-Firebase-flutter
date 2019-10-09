import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/screens/chat_screen.dart';
import 'package:messenger_app/screens/signup_screen.dart';
import 'package:messenger_app/utilities/custom_widgtes.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget{
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }

}

class _LoginScreenState extends State<LoginScreen>{

  final _auth = FirebaseAuth.instance;

  String phoneNo;
  String password;
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        opacity: 0,
        child: SafeArea(
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
                  phoneNo = "$value@messenger.com";
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
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(email: phoneNo, password: password);
                        if (user != null) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, ChatScreen.id, (route) => false);
                        }
                      }catch(e){
                        print(e);
                      }

                      setState(() {
                        showSpinner = false;
                      });
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
      ),
    );
  }

}