import 'package:flutter/material.dart';

class Userdata extends StatefulWidget {
  Userdata({Key key}) : super(key: key);

  @override
  _UserdataState createState() => _UserdataState();
}

class _UserdataState extends State<Userdata> {
  bool _expand = false;

  listItem(IconData icon, String field) {
    return SizedBox(
      height: 50,
      child: FlatButton(
        onPressed: () {
          switch (field) {
            case "Roles":
              print("Roles");
              break;
            case "Permission":
              print("Permission");
              break;
            case "Users":
              print("Users");
              break;
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
                  color: Colors.black,fontSize: 12
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
            height: _expand ? (150.0 + (3 * 50) + 10) : 150,
            duration: Duration(milliseconds: 300),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // ! Roles....
                    listItem(Icons.folder_shared, "Roles"),
                    // ! Permission....
                    listItem(Icons.person, "Permission"),
                    // ! Users....
                    listItem(Icons.people, "Users"),
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
                    "User Management",
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
