import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Here we are going to define the operations.

  var num1=0, num2=0, ans=0;

  //Making a text editor controller for the two text fields, here.
  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");
  //Now we will pass these controllers to the text fields written below.

  void calcSum(){
    setState(() {
      //Whenever these values will update, and we click on the plus button, we will be able to refresh the values, as this is what the setState() is used for. It notifies the framework that the internal state of the object has changed.
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      //It takes on the integer value of the text contained within the t1 and t2 controllers, and we will perform the operations on them.
      ans = num1+num2;
    });
  }
  void calcDiff(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      ans = num1-num2;
    });
  }
  void calcProd(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      ans = num1*num2;
    });
  }
  void calcQuot(){
    setState(() {
      try {
        num1 = int.parse(t1.text);
        num2 = int.parse(t2.text);
        ans = num1 ~/ num2; // '~/' operator returns an integer value of the result of division.
      } on IntegerDivisionByZeroException{
        ans = null;
      }
    });
  }
  void Clear(){
    setState(() {
      t1.text='0';
      t2.text='0';
      ans=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("newCalculator"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(45.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Output: $ans", style: new TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
            //It will take a list, so we define children.
            new TextField(
              //It will take these here:
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Input Number 1",
              ),
              controller: t1,
              //Passed the controller to the text field.
            ),
            new TextField(
              //It will take:
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Input Number 2",
              ),
              controller: t2,
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  child: new Text("+", style: new TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),),
                  color: Colors.red,
                  onPressed: calcSum, //Implies that a method will be executed.
                ),
                new RaisedButton(
                  color: Colors.red,
                  child: new Text("-", style: new TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),),
                  onPressed: calcDiff, //Implies that a method will be executed.
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  child: new Text("*", style: new TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),),
                  color: Colors.red,
                  onPressed: calcProd, //Implies that a method will be executed.
                ),
                new RaisedButton(
                  color: Colors.red,
                  child: new Text("/", style: new TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),),
                  onPressed: calcQuot, //Implies that a method will be executed.
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  minWidth: 225,
                  color: Colors.red,
                  child: new Text("C", style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),),
                  onPressed: Clear,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
