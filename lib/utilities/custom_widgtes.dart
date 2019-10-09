import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class DefaultRaisedButton extends StatelessWidget{

  DefaultRaisedButton({this.text,this.onPressed});

  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey[900],
      splashColor: Colors.grey[800],
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.lightBlue,
          width: 2.0,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          this.text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontFamily: 'NotoSansSC'
          ),
        ),
      ),
      onPressed: this.onPressed,
    );
  }

}



class InputTextField extends StatelessWidget{

  InputTextField({this.icon,this.labelText,this.onChanged,this.obscureText:false});

  final Function onChanged;
  final IconData icon;
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 50.0,
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightBlue,
              width: 2.0,
            ),
          ),
          border: UnderlineInputBorder(),
          suffixIcon: Icon(
            this.icon,
          ),
          labelText: this.labelText,
        ),
        onChanged: this.onChanged,
      ),
    );
  }

}



class Footer extends StatelessWidget {

  Footer({this.text,this.linkText,this.onPressed});

  final String text;
  final String linkText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.text,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontFamily: 'NotoSansSC',
            fontSize: 20.0,
          ),
        ),
        FlatButton(
          child: Text(
            this.linkText,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.blue,
              fontFamily: 'NotoSansSC',
              fontSize: 20.0,
            ),
          ),
          onPressed: this.onPressed,
        ),
      ],
    );
  }

}




class MessageBubble extends StatelessWidget{

  MessageBubble({this.sender,this.text,this.isLoggedInUser,this.timeStamp});
  final String sender;
  final String text;
  final Timestamp timeStamp;
  final bool isLoggedInUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isLoggedInUser? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.only(
              bottomLeft: isLoggedInUser? Radius.circular(30.0) : Radius.circular(0),
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomRight: isLoggedInUser? Radius.circular(0) : Radius.circular(30.0),
            ),
            elevation: 2.0,
            color: isLoggedInUser? Colors.lightBlue : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                  child: Text(
                    sender,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: isLoggedInUser? Colors.yellow : Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSansSC'
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: isLoggedInUser? Colors.white : Colors.black,
                        fontFamily: 'NotoSansSC'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageField extends StatelessWidget{

  MessageField({this.onChanged,this.controller});

  final Function onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: this.controller,
        onChanged: this.onChanged,
        style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'NotoSansSC'
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          prefix: IconButton(
            splashColor: Colors.black,
            color: Colors.black,
            icon: Icon(Icons.insert_emoticon),
            onPressed: (){
              print("pressed");
            },
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide:BorderSide.none
          ),
        ),
      ),
    );
  }

}