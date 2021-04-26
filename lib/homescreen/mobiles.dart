import 'package:flutter/material.dart';
import 'package:health/homescreen/main_homescreen.dart';

class Mobile extends StatefulWidget {
  @override
  _Dropp createState() => _Dropp();
}

final Color primaryColor = Colors.red;

class _Dropp extends State<Mobile> {
  String item1, item2, item3, item4;
  List listItem = ["001", "002", "003", "004"];
  List name = ["aaa", "bbb", "ccc"];
  List company = ["NABH", "NABL", "JCI"];
  List notes = ["aaa", "bbb", "ccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile", style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle),
              labelText: "Simulator 1: ",
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: "Simulator 2: ",
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: "APK 1: ",
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.business_center_rounded),
              labelText: "APK 2: ",
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.business),
              labelText: "iOS 1: ",
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.note),
              labelText: "iOS 2: ",
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
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
