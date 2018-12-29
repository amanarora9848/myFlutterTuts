import 'package:flutter/material.dart';
import 'home_page.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      color: Colors.red,
      title: 'newChatApp',
      home: new HomePage(),
    );
    //new is to create a new instance of that particular class.
  }
}
