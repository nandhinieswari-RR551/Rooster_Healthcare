import 'package:flutter/material.dart';
import 'second.dart';
import 'welcome.dart';
import 'package:provider/provider.dart';
import 'package:health/theme_changer.dart';
import 'package:health/model/user_model.dart';
import 'package:animated_splash/animated_splash.dart';



void main() {
  
Function duringSplash = () {
	// Splash Screen function 
	int a = 123 + 23;
	print(a);

	if (a > 100)
	return 1;
	else
	return 2;
};

Map<int, Widget> op = {1: Home(), 2: Second()};

runApp(MultiProvider(
      providers: [       
        ChangeNotifierProvider(create: (_) => ThemeChanger())
      ],
      
 child:MaterialApp(
  debugShowCheckedModeBanner: false,
	home: AnimatedSplash(
    //Image and duration for Splash Screen
	imagePath: 'assets/image3.png',
	home: Home(),
	customFunction: duringSplash,
	duration: 2000,
	type: AnimatedSplashType.BackgroundProcess,
	outputAndHome: op,
	),
 )
));
}

class Home extends StatefulWidget {
@override
_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
@override
Widget build(BuildContext context) {
	return MaterialApp(
    debugShowCheckedModeBanner: false,
  home: Scaffold(		
		body: Welcome()
    ));
}
}
