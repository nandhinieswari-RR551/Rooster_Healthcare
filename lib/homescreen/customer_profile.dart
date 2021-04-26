import 'package:flutter/material.dart';
import 'package:health/homescreen/main_homescreen.dart';

class Customerprofile extends StatefulWidget {
  @override
  _Dropp createState() => _Dropp();
}

final Color primaryColor = Colors.red;

class _Dropp extends State<Customerprofile> {
  String item1, item2, item3, item4;
  List listItem = ["001", "002", "003", "004"];
  List name = ["aaa", "bbb", "ccc"];
  List company = ["NABH", "NABL", "JCI"];
  List notes = ["aaa", "bbb", "ccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text("Customer Profile", style: TextStyle(color: Colors.white)),
          backgroundColor: primaryColor,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                //SizedBox(height:20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "ID: ",
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Full Name: ",
                  ),
                ),

                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Calling Name: ",
                  ),
                ),

                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.business_center_rounded),
                    labelText: "Business_Registration_No: ",
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.business),
                    labelText: "Business_Registration_Name: ",
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.note),
                    labelText: "Business_Working_Address: ",
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: "Email ID: ",
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.note),
                    labelText: "Secondary Email ID: ",
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.local_phone),
                    labelText: "Landline Number : ",
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.note),
                    labelText: "Secondary Landline: ",
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: "Mobile: ",
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.note),
                    labelText: "Secondary Mobile: ",
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.note),
                    labelText: "Whatsapp Number: ",
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.note),
                    labelText: "Telegram Number: ",
                  ),
                ),

                SizedBox(height: 18),

                RaisedButton(
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  color: primaryColor,
                ),
              ],
            ),
          ),
        ));
  }
}
