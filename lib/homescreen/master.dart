import 'package:flutter/material.dart';
import 'package:health/homescreen/customer_contacts.dart';

import 'package:health/homescreen/mobiles.dart';
class Master extends StatefulWidget {
  Master({Key key}) : super(key: key);

  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  bool _expand = false;

  listItem(IconData icon, String field) {
    return SizedBox(
      height: 50,
      child: FlatButton(
        onPressed: () {
          if(field=="Customer Contacts")
         {
           return Navigator.push(context, MaterialPageRoute(builder: (context)=> Customer()));
         }
         else if(field=="Mobile")
         {
           return Navigator.push(context, MaterialPageRoute(builder: (context)=> Mobile()));
         }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Icon(
                icon,
                color: Colors.black,
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(
                "$field",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          color: Colors.grey[200],
          elevation: 5,
          child: AnimatedContainer(
            width: 150,
            height: _expand ? (150.0 + (2 * 50) + 10) : 150,
            duration: Duration(milliseconds: 300),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // ! Roles....
                    listItem(Icons.folder_shared, "Customer Contacts"),
                    // ! Permission....
                    listItem(Icons.mobile_screen_share_outlined,"Mobile"),
                    // ! Users....
                    //listItem(Icons.people, "Users"),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _expand = !_expand;
            });
          },
          onLongPress: () {
            setState(() {
              _expand = !_expand;
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
                    "Master",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
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
