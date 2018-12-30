//Basic, required OOPS concepts in Dart.

void main(){
  //superman is object of Hero class.
  var superman = new Hero('Clark');
  //Whenever we have to use object we have to create the new keyword since it is creating a new instance.
  superman.myPower();
  
  var spiderman = new Hero('Peter');
  //Creating a new instance of a class whenever we are calling it for this.
  spiderman.myPower();
}

class Hero {
  //Class name starts with a capital letter.
  String name;
  
  //Constructor. It is always called when we create an ninstance of a class.
  Hero(name){
    this.name = name;
  }
  
  myPower(){
    //Method
    print('${name} can fly.');
  }
  
}
