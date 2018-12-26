import 'package:flutter/material.dart';

void main(){
  //Whatever we perform is here only.
  //Call method runApp.

  //runApp(new MaterialApp(home: new Text("Hello World, it's Aman, and I am going to become an Android developer!")));
  //Under runApp pass object of a class.

  //What this does is, it displays Hello world etc. text on the app page of the mobile. We don't need this right now, so commenting.



  /////////////////////////////////////// EXPLANATION /////////////////////////////////////
  // Under android development, everything is a widget, can be a button, layout or anything you use as user interface. In flutter, no tension of activity, etc. In flutter, widgets are of two types, stateful and stateless.

  // If a widget changes, for example a user interacts with it, so it's stateful.
  // Widget's state consists of values that can change, like a slider's current value or a checkbox is checked or not.
  //The state is stored in the State object, separating a widget's state from it's appearance.
  //When a widget's state changes (example a button is clicked), the state object calls a method setState(), telling the framework to redraw, (example, on clicking hello world, if I want to display "Welcome aboard", then it will do the same.


  // Now a stateless widget has no internal state to manage, jiski value kabhi change nahi honi, (example icon, button, something like that, won't change dynamically).
  // Icon, IconButton, and text are examples of stateless widgets, which subclass StatelessWidget.

  // Also, a stateful widget is dynamic, its value keeps on changing as per user.
  // A user can interact with a stateful widget, for example can move a scroller, click a button.
  // The user can interact with a stateful widget.
  // It can also change over time (like a data feed can cause UI to update).
  // Checkbox, radio, slider, Inkwell, Form, and TextField are examples of stateful widgets, which subclass StatefulWidget.
  ////////////////////////////EXPLANATION OVER///////////////////////////////////



  // We now create a object MyApp(). So we have to create a separate class, which we can inherit in two ways stateless or stateful.
  runApp(new MyApp());


}


// Here we go on to create the class, which can be either stateful or stateless. We have templates, so we can type stless or stful to get the stateless or stateful template on the editor.



//////////////////////////////// USE OF STATELESS WIDGET ////////////////////////////////////////

/*
class MyApp extends StatelessWidget {
  @override
  //Just a method is being overridden, called build.
  Widget build(BuildContext context) {
    //Whenever we will make an object of the MyApp(), this build object will be called, and it returns a container.
    //return Container();
    // The container is a box, which presently does not have anything, so we need to put in     something.


  // Hum isko bolenge, ek MaterialApp return karo, title hai MyApp, jisme ek structure banana hai having an AppBar and a Body.
  return new MaterialApp(
    title: "Aman first App",
    home: new Scaffold(
      //It's a class, which provides some structure of the material app.
      appBar: new AppBar(
        title: new Text("Flutter First Page"), // This becomes the title of the toolbar. VVVIMP!!
      ),
      body: new Center(child: new Text("Hello World! This is my World, Aman's world!")), //Child is the attribute, in which we are representing a text.
        //It itself is a class, which shows anything you want in the centre.

    ),
    );
  }
}
*/

//// In a similar way, we create a new stateless widget, the one we are going to use now wih the stateful widget.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "MyApp",
      home: new HomePage(),
      theme: new ThemeData(
        // It is a theme. Now we currently don't have anything to select as such in the theme. So we create a new ThemeData in this. In this, I put the theme. So we decide the primary color or Swatch.

        primarySwatch: Colors.green,
        brightness: Brightness.light,
        accentColor: Colors.lightBlue,

      ),
    );
  }
}





// Now we see how the app performs with the stateful widget.

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
// So we created MyApp widget. 2 classes have been formed here. one is _MyAppState, which creates . Wherever there is '_' first in the class name, it is private variable, class or method.
}






class _HomePageState extends State<HomePage> {


  String myText = "Hello World!";
  // This text will be changed when the button will be clicked. So I declare this here.

  void _changeText(){
    // It will be called when onPressed is executed.
    setState(() {
      // Iske andar, mai jo bhi perform karana chahta hoon, karvaunga.

      ///////// Karvana kya hai?
      // So now I aim to change the text when I click the button, and then back to previous if I click the button again.


      if(myText.startsWith("H")){
        myText = "Welcome to my new App!";
      }
      else if(myText.startsWith("W")){
        myText = "Hello World!";
      }


    });
    //It will tell our framework ki bhai, aap uss widget ko update ya redraw kardo.
  }



  ///////////// Here, I create a widget having a button and some text.
  Widget _bodyWidget(){
    return new Container(
      //We'll be using container whenever we want to give margins, or padding, or other type of decorations, like background-color, height, etc. properties.
      padding: const EdgeInsets.all(8.0),
      // Har jagah se, jitni bhi edges hain itni padding de do. It has a child, Center, that whatever we wanna display has to be in center. Center has children, center mein kya kya dikhana chahte ho. Example column here, in which we can put multiple things.
      child: new Center(
        child: new Column(

          // Here, note that column contents will still not come in the center, even if it's in the Center class. The Column and the Row have properties MainAxis and CrossAxis. MainAxis of column is the vertical position and Cross axis is the horizontal position. Similarly, for Row, MainAxis is it's horizontal position, and the cross axis is the vertical axis.

          // So, we align the MainAxis alignment of column.
          mainAxisAlignment: MainAxisAlignment.center,
          //Vertical position ko centered kar do, because horizontal centered thi abhi, before this.

          // But also, HERE I CANNOT GIVE THE PADDING. So we intend to use the container.


          children: <Widget>[
            new Text(myText, style: new TextStyle(
              fontSize: 24.0,
            )),



            /*new RaisedButton(
              //Raised material type button.
              //Now, we take a text in it's child, which we call ClickButton. it has a property, ki press hone pe kya ho.

              child: new Text("Click", style: new TextStyle(
                fontSize: 20.0,

              )),
              onPressed: _changeText,
              // onPressed is for fixing, what will happen when the button is pressed. Here we are going to create another method, changeText.

              // Now, I also want to change the color of the button. So I use the 'color' property of RaisedButton class.
              color: Colors.lightBlue,
              textColor: Colors.white, // For this we can also do one more thing, we can directly change the text properties in the child section, where Click is written, above.


            )*/
            // I removed this raisedButton since I don't need this right now. I am putting a floating action button.


            ///// We put the floating action button at the Scaffold below, to the 'body'. ////



          ],
        ),
      ),

    );
  }




  @override
  Widget build(BuildContext context) {
    // return Container();
    // Again, we are going to create a Scaffold instead of container, so I comment out this.

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      // body: new Center(child: new Text("Hello there Stateful Widget!"),),
      // Now I don't need this Center thing, since I am passing a Widget _bodyWidget.

      body: _bodyWidget(),
      floatingActionButton: new FloatingActionButton(

        // We write a child for this FloatingActionButton.
        child: new Icon(Icons.add), // Child, we want is an icon, 'plus', so we call new Icon and in that, we give Icons.add, it adds color according to theme automatically, as set before.
        onPressed: _changeText, // Call the change text method, coded above.


      ),

    );
  }
}

