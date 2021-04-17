import 'package:flutter/material.dart';
import 'nabh.dart';
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
      body: Stack(children: [
        ClipPath(
  clipper: BezierClipper(), //BezierClipper used to draw curve in UI
  child: Container(
    color : Colors.red,
    //Container for Bezier Curve with color
    
  ),
),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( //Text field for welcome
            "Welcome!",
            style: TextStyle(color: Colors.white,
                fontSize: 25, fontWeight: FontWeight.bold, ),
          ),
          SizedBox( //Sized box used to make space between the widgets
            height: 150,
          ),
          
          Container(   //Image container with circular border
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
          ),
          Text(// Text field for Rooster Healthcare with comfortaa 
            "Rooster Healthcare",
            style: TextStyle(
                color: Colors.red,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa'),
          ),
          SizedBox(
            height: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval( 
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "NABH",
                style: TextStyle(color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                width: 10,
              ),
              ClipOval(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "NABL",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                width: 10,
              ),
              ClipOval(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "JCI",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            elevation: 5,
            onPressed: () {              
              Navigator.push(context, MaterialPageRoute(builder: (context) => Nabh()));
            },
            child: Text("Let's Start"),
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
  path.lineTo(0, size.height*0.47); //vertical line
  path.cubicTo(size.width/3, size.height/2, 2*size.width/3, size.height*0.3, size.width, size.height*0.35); //cubic curve
  path.lineTo(size.width, 0); //vertical line
  return path;
}

@override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
