import 'package:flutter/material.dart';
import 'second.dart';
import 'welcome.dart';
import 'package:provider/provider.dart';
import 'package:health/theme_changer.dart';
import 'package:health/model/user_model.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_splash/animated_splash.dart';



void main() {
runApp(MultiProvider(
      providers: [       
        ChangeNotifierProvider(create: (_) => ThemeChanger())
      ],
      
 child:MaterialApp(
  debugShowCheckedModeBanner: false,
	home: AnimatedSplashScreen(
    
    //Image and duration for Splash Screen
	        duration: 5000,
          splash: ClipOval(
                              child: Container(
                                width: 100,
                                height: 700,
                                decoration: BoxDecoration(
                                  color: Colors.tealAccent[50],
                                  borderRadius: BorderRadius.circular(200),
                                ),
                                child: FittedBox(
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/images/logo.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),                              
                            ),
          nextScreen: Welcome(),
          splashTransition: SplashTransition.rotationTransition,          
          backgroundColor: Colors.teal
  )
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
  home: Container(
    color: Colors.teal[100],
  )
    );
}
}
