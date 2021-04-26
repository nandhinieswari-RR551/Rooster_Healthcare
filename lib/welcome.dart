import 'package:flutter/material.dart';

import 'package:health/loginscreen/main_logincardscreen.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.tealAccent,
      body: Stack(children: [
        ClipPath(
  clipper: BezierClipper(), //BezierClipper used to draw curve in UI
  child: Container(
    color : Colors.teal[100],
    //Container for Bezier Curve with color
    
  ),
),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Positioned(
	                    child:  Container(
	                      margin: EdgeInsets.only(top: 5),
	                      child: Center(
	                        child: Text("Welcome", style: TextStyle(color: Colors.teal, fontSize: 30, fontWeight: FontWeight.bold),),
	                      ),
	                    )),
                      SizedBox( //Sized box used to make space between the widgets
            height: 50,
          ),
                      Positioned(
            top: 0,
            left: 50,
            child: Image.asset(
              "assets/light1.png",
              width: 300,
            ),
          ),
          
          SizedBox( //Sized box used to make space between the widgets
            height: 80,
          ),
          
          /*Container(   //Image container with circular border
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/logo.png"),
                  ))),
          SizedBox(
            height: 10,
          ),*/
          Text(// Text field for Rooster Healthcare with comfortaa 
            "Rooster Healthcare", textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.teal,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa'),
          ),
          SizedBox(
            height: 100,
          ),
          ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          splashColor: Colors.tealAccent,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 45),
          color: Colors.teal,
          onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginCardScreen()));
          },
          child: Text("LOGIN",            
            style: TextStyle(color: Colors.white),
          ),
        
          ),
          ),
          
          SizedBox(
            height: 20,
          ),
          ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          splashColor: Colors.tealAccent,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: Colors.teal,
            onPressed: () {              
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginCardScreen()));
            },
            child: Text("SIGNUP",style: TextStyle(color: Colors.white)),
          ),
          ),
          
        ],
      ),
      ]
    )
        )
      
    );
  }
}

class BezierClipper extends CustomClipper<Path>{
 @override
Path getClip(Size size){
  Path path = new Path();
  path.lineTo(0, size.height*0.17); //vertical line
  path.cubicTo(size.width/1, size.height/6, 3*size.width/3, size.height*0.3, size.width, size.height*0.25); //cubic curve
  path.lineTo(size.width, 0); //vertical line
  return path;
}

@override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
