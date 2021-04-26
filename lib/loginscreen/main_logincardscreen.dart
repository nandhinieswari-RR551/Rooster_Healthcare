import 'dart:math';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'loginscreen.dart';
import 'registerscreen.dart';

class LoginCardScreen extends StatefulWidget {
  @override
  _LoginCardScreenState createState() => _LoginCardScreenState();
}

class _LoginCardScreenState extends State<LoginCardScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _cardController;
  Animation _cardAnimation;

  @override
  void initState() {
    super.initState();
    _cardController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _cardAnimation = Tween(begin: 0.0, end: pi).animate(_cardController);
  }

  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: Colors.teal,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _cardController,
          builder: (context, child) {
            return Stack(
              children: <Widget>[  
                
                   SizedBox(height:100) , 
                /* FlareActor(
                  "assets/anim/rooster.flr",
                  artboard: "LoginBackground",
                  animation: "city-cloud",
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),*/
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height:130) , 
                        Transform(
                            origin:
                                Offset((width * 0.92) / 2, (height * 2.80) / 2),
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(_cardAnimation.value),
                            child: Opacity(
                              opacity: 0.7,
                              child: Card(
                                color: Colors.tealAccent[100],
                                elevation: 10,
                                child: _cardAnimation.value < pi / 2
                                    ? LoginScreen()
                                    : RegisterScreen(
                                        cardController: _cardController,
                                      ),
                              ),
                            )),
                            Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: RichText(
                              text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: _cardAnimation.value < pi / 2
                                      ? "Don't have an account ? "
                                      : "Already have an account ? ",
                                  style: TextStyle(fontSize: 18,
                                    color: Colors.teal[200],
                                  )),
                              TextSpan(
                                  text: _cardAnimation.value < pi / 2
                                      ? "Create Account "
                                      : "Log In ",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _cardController.isDismissed
                                          ? _cardController.forward()
                                          : _cardController.reverse();
                                    },
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))
                            ],
                          )),
                        ),
                            Transform.translate(
                    offset: Offset(0,-700),
                    child: ClipOval(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FittedBox(
                          alignment: Alignment.center,
                          child: Image.asset("assets/login.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ), 
                        
                      ],
                    )
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
