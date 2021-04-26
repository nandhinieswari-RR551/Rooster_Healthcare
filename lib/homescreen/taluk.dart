import 'package:flutter/material.dart';
import 'package:health/homescreen/main_homescreen.dart';

class Taluk extends StatefulWidget {
  @override
  _Dropp createState() => _Dropp();
}

final Color primaryColor = Colors.red;

class _Dropp extends State<Taluk> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Taluk", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(child: Padding(padding: const EdgeInsets.all(25) ,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          //SizedBox(height:20),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.location_city),
              labelText: "Taluk name: ",
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.location_city),
              labelText: "District name: ",
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.location_city),
              labelText: "State Code: ",
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.location_city),
              labelText: "Alpha 2 code: ",
            ),
          ),
          SizedBox(height: 18),

          RaisedButton(
            child: Text('Save', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: Colors.teal,
          ),
        ],
      ),
      ))
    );
  }
}
