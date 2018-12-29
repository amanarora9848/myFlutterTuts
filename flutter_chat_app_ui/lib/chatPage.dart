import 'package:flutter/material.dart';
import 'chat_msgs.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  //We will have a textController for our text field.
  final TextEditingController _textController = new TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];
  //This is how we create a list. ChatMessage is the class wee created in the other file.

  //The message that we write should be written to the list that we declared above. Then it has to be cleared, which is being taken care of by _handleSubmitted.

  void _handleSubmitted(String text){
    //Now, this method receives a text, because user enters that only. So we take string as a parameter. When we send that message, the TextField is cleared by default.
    _textController.clear();
    //We write instance of ChatMessage.
    ChatMessage message = new ChatMessage(
      text: text,
      //This accepts a text because we defined the text in the constructor. So we can pass the abovtext which we are gtting from the method.
    );
    setState(() {
      //When we wanna rebuild the widget.
      _messages.insert(0, message);
      //At the index 0, insert the data in message.
      //It rebuilds the list that we have.
    });
  }

  //We are creating a widget.
  Widget _textComposerWidget(){
    
    //Wrapping this container up in an icon theme, so that we can add more colors to it.
    return new IconTheme(
      //We can specify some data here, which is currently IconThemeData.
      data: new IconThemeData(
        color: Colors.red,
        //We want the colors to be any of the above listed.
      ),
      child: new Container(
        //Margin from left and right.
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        //Symmetric is used if you want to give the margin from either horizontal or vertical, so it provides two options.

        child: new Row(
          children: <Widget>[
            new Flexible(
              //It creates a widget that controls how a child of [Row], [Column] or [Flex] flexes.

              child: new TextField(
                decoration: new InputDecoration.collapsed(
                  //It defines the InputDecorator the same size as of the input field.
                  hintText: "Send a message",
                ),
                controller: _textController,
                //'_' is used to specify the thing is private.

                //Whenever we will get the massage from the user, e will have to submit it. We have to make the below method.
                onSubmitted: _handleSubmitted,

              ),
            ),

            //We need to add an icon button for sening message. So we add a container.
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text),
              ),
            )

          ],
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            //List needs to be in reverse order because the list will generate from the bottom of the screen.
            reverse: true,
            //We want the list to be displayed in the reverse order.
            itemBuilder: (_, int index) => _messages[index],
            //It takes a build context()defined by just putting the '_' character and an index.
            itemCount: _messages.length,
          ),
        ),
        new Divider(
          //Dividing elements.
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            //Gives a color
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        ),
      ],
    );
  }
}
