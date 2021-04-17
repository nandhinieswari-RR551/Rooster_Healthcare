
//import 'dart:js';
import 'main_homescreen.dart';

import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  Aboutus({Key key}) : super(key: key);

  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  var _expand = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          color: Colors.grey[200],
          elevation: 5,
          child: AnimatedContainer(
            width: 150,
            height: _expand ? 300 : 150,
            duration: Duration(milliseconds: 200),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => _aboutUS()));
              
            });
          },
          onLongPress: () {
            setState(() {
              // TODO : Aboutus options....
            });
          },
          child: Card(
            color: Colors.white,
            elevation: 5,
            child: Container(
              width: 150,
              height: 150,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "About NABH",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
_aboutUS(){
 
return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    appBar: AppBar(title: Text("About NABH"),
    backgroundColor: Colors.blue,
    // ignore: missing_required_param
    leading:IconButton( 
              icon: Icon(Icons.arrow_back),
              tooltip: 'Back',
              //onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              //}
            ),
     
    
        ),
    
    body: ListView(children:<Widget>[
    ListTile( 
    title: Center(child: Text("ABOUT NABH ROLES AND RESPONSIBILITIES", 
    style: TextStyle(fontSize: 30,color: Colors.green,),textAlign: TextAlign.center,),),),
    ListTile(title: Text("PURPOSE", style: TextStyle(fontSize: 25,color: Colors.pink),textAlign: TextAlign.left,),),
     ListTile(tileColor: Colors.pink[100],
       title:Text(" " " " " " " " " " "* "  " " "To define the responsibilities of those responsible for governance",
      style: TextStyle(fontSize: 20,color: Colors.black),
      textAlign: TextAlign.left,),),
    ListTile(tileColor: Colors.pink[100],title:Text(" " " " " " " " " " "* "  " " "To ensure that the organization is managed in an ethical manner",
      style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.left),),
    ListTile(tileColor: Colors.pink[100],title:Text(" " " " " " " " " " "* "  " " "To define responsibilities of multi-disciplinary committees for overseeing specific aspects of quality and patient safety",
      style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.left),),
       SizedBox(height: 15),
    ListTile(title: Text("POLICIES", style: TextStyle(fontSize: 25,color: Colors.pink),textAlign: TextAlign.left,),),
     ListTile(tileColor: Colors.purple[100],title:Text(" " " " " " " " " " "* "  " " "We hereby assure quality healthcare to patients through reliable healthcare services, available medicines and maintainable equipments",
      style: TextStyle(fontSize: 20,color: Colors.black),
      textAlign: TextAlign.left,),),

ListTile(tileColor: Colors.purple[100],title:Text(" " " " " " " " " " "* "  " " "We shall review this policy for continuing suitability, adequacy and effectiveness.",
      style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.left),),
    ListTile(tileColor: Colors.purple[100],title:Text(" " " " " " " " " " "* "  " " "We shall achieve this through the quality objectives and targets set for various departments",
      style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.left),),
      //Spacer(flex: 5,),
      SizedBox(height: 15),
      ListTile(title: Text("RESPONSIBILITIES", style: TextStyle(fontSize: 25,color: Colors.pink),textAlign: TextAlign.left,),),
     ListTile(tileColor: Colors.yellow[100],title:Text(" " " " " " " " " " "* "  " " "Document and issue infection control manual including policies",
      style: TextStyle(fontSize: 20,color: Colors.black),
      textAlign: TextAlign.left,),),
    ListTile(tileColor: Colors.yellow[100],title:Text(" " " " " " " " " " "* "  " " "Surveillance and monitoring for compliance with policies",
      style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.left),),
    ListTile(tileColor: Colors.yellow[100],title:Text(" " " " " " " " " " "* "  " " "Issue antibiotic policy",
      style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.left),),
    ListTile(tileColor: Colors.yellow[100],title:Text(" " " " " " " " " " "* "  " " "Monitor Hospital acquired infection",
      style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.left),),
    
    ]),

      ),
    );
  
  }