import 'package:flutter/material.dart';
import 'home_page.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Container();
    return new MaterialApp(
      //It will give us the material app with all it's functions like title, etc.

      title: "Calculator",
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),

      home: new HomePage(),
    );
  }
}



//Creating HomePage.
//As a separate file, we make the class, as filename home_age.dart. it will be imported into this file.
