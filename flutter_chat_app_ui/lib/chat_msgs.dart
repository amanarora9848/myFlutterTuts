import 'package:flutter/material.dart';

const String _name = "Aman";

class ChatMessage extends StatelessWidget {
  final String text;

  //ChatMessage constructor.
  ChatMessage({this.text});
  //For optional fields we use curly braces.

  @override
  Widget build(BuildContext context) {
    return new Container(
      //Whenever we will send a message to the person, there's out photo and the message in the form of text sent to the person.
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        //Row or width portion so that we can have multiple elements in a single row.

        crossAxisAlignment: CrossAxisAlignment.start,
        //It enables the content to start from top.

        children: <Widget>[
          new Container(
            //Photo of the user.
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              child: new Text(_name[0]),
              //We pass the first letter of the name.

            ),
          ),
          new Column(
            //The name of the person and his/her text.
            crossAxisAlignment: CrossAxisAlignment.start,
            //Remember, for a column, cross axis is horizontal, so start means left.
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead,),
              //What we are doing is basically assigning name and doing some styling with the text.
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                //Because above it is our name, so below that shouldn't be any margin.
                child: new Text(text),
                //Whatever that will be written by user.
              )
            ],
          )
        ],
      ),
    );
  }
}


