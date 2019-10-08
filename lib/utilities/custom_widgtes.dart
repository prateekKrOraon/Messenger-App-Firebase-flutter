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

  InputTextField({this.icon,this.labelText,this.onChanged});

  final Function onChanged;
  final IconData icon;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 50.0,
      ),
      child: TextField(
        decoration: InputDecoration(
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