import 'package:flutter/material.dart';

class Second extends StatefulWidget {
@override
_SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
@override
Widget build(BuildContext context) {
	return Scaffold(
		appBar: AppBar(
		title: Text('GeeksForGeeks'),
		backgroundColor: Colors.red,
		),
		body: Center(
			child: Text('My Second Page',
				style: TextStyle(color: Colors.black,
					fontSize: 20.0))));
}
}
