import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              // TODO :Dashboard options....
            });
          },
          onLongPress: () {
            setState(() {
              // TODO : Dashboard options....
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
                    "Dashboard",
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
