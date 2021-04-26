import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health/model/user_model.dart';
import 'package:health/string.dart';
import 'package:health/homescreen/main_homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mailId;
  String _password;
  bool _obscureText = true;

  Widget button = Text('Login', style: TextStyle(fontSize: 20));

  String resetMail;

  @override
  void dispose() {
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  resentConfirmation() async {
    var response = await http.post(StringData.emailConfirmationAPI, body: {
      'email': mailId,
    });
    var result = json.decode(response.body);
    if (result["result"] == "success") {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(result["message"])));
    }
  }

  loginUser() async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // ! get SharedPreferences....
    try {
      var response = await http.post(StringData.loginAPI, body: {
        'email': mailId,
        'password': _password,
      });
      var result = json.decode(response.body);
      if (result["result"] == "verified") {
        UserModel model = Provider.of<UserModel>(context,
            listen: false); // TODO:use the provide....
        model.email = mailId;
        model.token = result["token"];
        await prefs.setString(
            'token', result["token"].toString()); // ! Save the token local....
        await prefs.setString(
            'email', mailId.toString()); // ! Save the token local....
        setState(() {
          button = Text('Login', style: TextStyle(fontSize: 20));
        });
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(), ));
      } else {
        setState(() {
          button = Text('Login', style: TextStyle(fontSize: 20));
        });
        if (result["error"] ==
            "Your email address has not yet been confirmed") {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 250,
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.topCenter,
                  fit: StackFit.loose,
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(0, -50),
                      child: ClipOval(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: FittedBox(
                            alignment: Alignment.center,
                            child: Image.asset("assets/images/logo.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, 60),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Your email address has not yet been confirmed",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          RaisedButton(
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            elevation: 5,
                            onPressed: () {
                              Navigator.of(context).pop();
                              resentConfirmation();
                            },
                            child: Text("Resent Confirmation"),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(result["error"])));
        }
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      print(e.toString());
    }
  }

  resetPassword() async {
    var response = await http.post(StringData.forgotPasswordAPI, body: {
      'email': resetMail,
    });
    var result = json.decode(response.body);

    if (result["result"] == "success") {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(result["message"])));
    }
  }

  final _formKey = GlobalKey<FormState>();

  FocusNode emailIdTextFieldFocusNode = FocusNode();
  FocusNode passwordTextFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.9,
      height: height * 0.7,
      child: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
              child: Column(
                children: <Widget>[
                  //titleHeading(),
                  SizedBox(height: 15),
                  titleText(),
                  emailTextField(),
                  passwordTextField(),
                   SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      forgetPasswordButton(),
                      loginButton(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*titleHeading() {
    return Text(
      "DHANVA",
      style: TextStyle(
        color: Colors.red,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }*/

  titleText() {
    return Text(
      "Login",
      style: TextStyle(
        color: Colors.teal[900],
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  emailTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child:
       TextFormField(
        focusNode: emailIdTextFieldFocusNode,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
          border: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.black)
                      //borderSide: const BorderSide(),
                    ),
          hintStyle: TextStyle(color: Colors.white,fontFamily: "WorkSansLight"),
                    filled: true,
                    fillColor: Colors.teal[500],
                    hintText: 'Email Id',
          
        ),
        onFieldSubmitted: (value) {
          _fieldFocusChange(
              context, emailIdTextFieldFocusNode, passwordTextFieldFocusNode);
        },
        onChanged: (value) => mailId = value,
        validator: (value) {
          if (value.isEmpty) {
            return "This field is empty";
          }
          return value.contains('@') && value.contains('.com')
              ? null
              : "Invalid Email Id.";
        },
      ),
    );
  }

  passwordTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              focusNode: passwordTextFieldFocusNode,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) {
                passwordTextFieldFocusNode.unfocus();
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
          border: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.black)
                      //borderSide: const BorderSide(),
                    ),
          hintStyle: TextStyle(color: Colors.white,fontFamily: "WorkSansLight"),
                    filled: true,
                    fillColor: Colors.teal[500],
                    hintText: 'Password',
                suffixIcon: IconButton(color: Colors.black,
                  onPressed: _toggle,
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              onChanged: (value) => _password = value,
              obscureText: _obscureText,
              validator: (val) {
                if (val.isEmpty) return "This field is Empty";
                if (val.length < 5) return "Password is too short";
                if (!val.contains(new RegExp(r'[0-9]')))
                  return "Password must have atleast \none number";
                if (!val.contains(new RegExp(r'[A-Z]')))
                  return "Password must have atleast \none capital letter";
                if (!val.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]')))
                  return "Password must contain atleast \none special character";
                return null;
              },
            
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }

  forgetPasswordButton() {
    return FlatButton(
      onPressed: () {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 300,
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.topCenter,
                fit: StackFit.loose,
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(0, -50),
                    child: ClipOval(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FittedBox(
                          alignment: Alignment.center,
                          child: Image.asset("assets/images/logo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, 60),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Enter the email to reset password",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "This field is empty";
                              }
                              return value.contains('@') && value.contains('.')
                                  ? null
                                  : "Invalid Email Id.";
                            },
                            onChanged: (value) => resetMail = value,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Theme.of(context).primaryColor,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Enter email",
                                labelText: "email"),
                          ),
                        ),
                        RaisedButton(
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          elevation: 5,
                          onPressed: () {
                            Navigator.of(context).pop();
                            resetPassword();
                          },
                          child: Text("Reset Password"),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      textColor: Colors.black,
      child: Text("Forget Password"),
    );
  }

  loginButton() {
    return RaisedButton(
      color: Colors.teal[900],
      elevation: 8,
      onPressed: button is Text
          ? () {
              if (_formKey.currentState.validate()) {
                setState(() {
                  button = CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  );
                });
                // loginUser();
                Navigator.pushReplacement( context,    MaterialPageRoute(builder: (context) => HomeScreen(),  ));
              }
            }
          : null,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: button,
      ),
    );
  }
}
