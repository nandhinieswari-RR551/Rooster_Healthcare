import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health/string.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key, this.cardController}) : super(key: key);
  final AnimationController cardController;
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String userName;
  String mailId;
  String _newPassword, _confirmPassword;
  String uid;

  Widget button = Text('Create Account', style: TextStyle(fontSize: 20));

  bool _obscureTextNewPassword = true;
  final _formKey = GlobalKey<FormState>();

  void _toggleNewPassword() {
    setState(() {
      _obscureTextNewPassword = !_obscureTextNewPassword;
    });
  }

  bool _obscureTextConfirmPassword = true;
  void _toggleConfirmPassword() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }

  registerUser() async {
    var response = await http.post(StringData.registerAPI, body: {
      'email': mailId,
      'password': _newPassword,
      'retype_password': _confirmPassword
    });
    var result = json.decode(response.body);
    print(result);
    if (result["result"] == "registered successfully") {
      setState(() {
        button = Text('Create Account', style: TextStyle(fontSize: 20));
      });
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(result["message"])));
      widget.cardController.reverse();
    } else {
      setState(() {
        button = Text('Create Account', style: TextStyle(fontSize: 20));
      });
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(result["error"])));
    }
  }

  FocusNode emailidFocusNode = FocusNode();
  FocusNode newPasswordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Transform(
      origin: Offset((width * 0.90) / 2, (height * 0.60) / 2),
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(pi),
      child: Container(
        width: width * 0.9,
        height: height * 0.6,
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  titleText(),
                  emailTextField(),
                  newPasswordTextField(),
                  confirmPasswordTextField(),
                  createAccountButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  titleText() {
    return Text(
      "Register",
      style: TextStyle(
        color: Colors.red,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  emailTextField() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        focusNode: emailidFocusNode,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (value) {
          _fieldFocusChange(context, emailidFocusNode, newPasswordFocusNode);
        },
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          labelText: "Email Id",
        ),
        onChanged: (value) => mailId = value,
        validator: (value) {
          if (value.isEmpty) {
            return "This field is Empty";
          }
          return value.contains('@') && value.contains('.')
              ? null
              : "Invalid Email Id.";
        },
      ),
    );
  }

  newPasswordTextField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              focusNode: newPasswordFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (value) {
                _fieldFocusChange(
                    context, newPasswordFocusNode, confirmPasswordFocusNode);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: "New Password",
                suffixIcon: IconButton(
                  onPressed: _toggleNewPassword,
                  icon: Icon(_obscureTextNewPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
              onChanged: (value) => _newPassword = value,
              obscureText: _obscureTextNewPassword,
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

  confirmPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              focusNode: confirmPasswordFocusNode,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) {
                confirmPasswordFocusNode.unfocus();
              },
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: "Confirm Password",
                suffixIcon: IconButton(
                  onPressed: _toggleConfirmPassword,
                  icon: Icon(_obscureTextConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
              onChanged: (value) => _confirmPassword = value,
              obscureText: _obscureTextConfirmPassword,
              validator: (val) {
                if (val.isEmpty) {
                  return "This field is Empty";
                }
                if (_newPassword != _confirmPassword) {
                  return "Password does not match";
                }
                return null;
              },
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }

  createAccountButton() {
    return RaisedButton(
      color: Colors.red,
      elevation: 8,
      onPressed: button is Text
          ? () {
              if (_formKey.currentState.validate()) {
                setState(() {
                  button = CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  );
                });
                registerUser();
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
