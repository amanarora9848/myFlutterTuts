import 'package:flutter/material.dart';

void main() => runApp(new MyApp());
// runApp() is a method for running our application.
// In it, I make an instance myApp of my application, which, in the  doesn't exist, and we have to write that only.


// Creating class MyApp()
class MyApp extends StatelessWidget {
  @override
  //We have to override a method when we extend the above class.
  //Overriding is like, this method is already in stateless widget, but we want to customize something, so we want to write it again, in a better way.

  // Below method accepts a widget, and it expects a widget, whenever I am overriding this. It wants a widget returned back.
  Widget build(BuildContext context) {
    // return Container();
    return new MaterialApp(
      // We are dealing with material application only.

      home: new LoginPage(),// Our home or front screen, and it is an object of a LoginPage, and LoginPage is a class, which as of now is not created. So we go on to create it.
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),

    );
  }
}


// LoginPage. I want to add an image and animation here, and animation is stateful. So it'll be a stateful widget.

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  // We have two types of mixin's available. When its SingleTickerProviderStateMixin, then we define only 1 animation controller. When we have multiple animation controllers then we define TickerProviderStateMixin.


  //////  CODE FOR ANIMATION HERE   //////
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  // Controller will help us in animating the content, animation will be a double value, name _iconAnimation.


  // We go on to override another method.
  @override
  void initState() {
    //It is actually the initial state when the widget will be created.
    // TODO: implement initState

    super.initState();
    //super.initState()  method.


    // Creating instances for animation controller and the animations.
    _iconAnimationController = new AnimationController(
      // in this constructor we have to give vsync.
      vsync: this, // It creates animation controller. 'this' written because it is for current context, this object in other words only.

      duration: new Duration(milliseconds: 500),
    );
    // Creating instance for _iconAnimation.
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut,
    );
    // There are various types of animations, curved, tween, etc.



    // Now, when there are changes from 0 to 1, as the object bounces (0 and 1 represent up abd down state).
    //So, we need a listener which will change the state of this animation.
    
    _iconAnimation.addListener(() => this.setState(() {}));
    //The animation will change its value from 0 to 1 in this state (this.setState()).

    //Now tell the animation controller to do the animation by calling forward.
    _iconAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    // return Container();

    return new Scaffold(
      // provides structure to the document.
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        // We are going to overlap layouts, so we need Stack, and not a container.
        // It takes some properties like children, key, fit, etc.

        // Now image is not expanded. So we apply 'fit' property, which is StackFit, and expand the image to fit the screen.
        fit: StackFit.expand, // It expands the stack for this field.
        children: <Widget>[
          // We want an image.
          new Image(
            image: new AssetImage('assets/space.jpg'),

            // We have to fit it. So,
            fit: BoxFit.cover,

            color: Colors.black54, // Here the black is with 45% opacity.

            //We also need blend, so
            colorBlendMode: BlendMode.darken,

          ),
          ////// This was the first 'children', so we another now. ///////


          new Column(
            mainAxisAlignment: MainAxisAlignment.center, // For column, main axis is vertical, hence the logo will be vertically centered.
            children: <Widget>[
              // It has a logo, an input field, a login button as well.

              new FlutterLogo(
                size: _iconAnimation.value * 100,
                // Whatever the value it will have (0 to 1) and say it has 0.5 value, so size will be 0.5, so we multiply to scale the size.

              ),

              //Now we make a form for taking as input user values.
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.blue,
                    inputDecorationTheme: new InputDecorationTheme(
                      // For text fields only.
                      labelStyle: new TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                      )
                    )
                  ),
                  child: new Container(
                    //Container, because I wan to give padding.
                    padding: const EdgeInsets.all(40.0),
                    // all, because we want padding from all directions.
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter your E-mail : ",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),


                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter your Password : ",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true, // It hides the text.
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                        ),
                        new MaterialButton(
                          height: 40,
                          minWidth: 100,
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          child: new Text("Login", style: TextStyle(
                            fontSize: 20.0,
                          ),),
                          onPressed: ()=>{},
                          splashColor: Colors.black45,
                        ),

                      ],
                    ),
                  ),
                ),

              )



            ],
          )


          // We add in the asset, here it's the image in the assets folder.
        ],


      ),
    );
  }
}

