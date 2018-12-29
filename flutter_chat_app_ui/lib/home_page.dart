import 'package:flutter/material.dart';
import 'chatPage.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("myChatApp"),
      ),
      body: new ChatPage(),
      //It's because I want to display the list in body first and then at the bottom I will display the textField with send button.
    );
  }
}
