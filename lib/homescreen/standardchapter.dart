import 'package:flutter/material.dart';
import 'package:health/homescreen/main_homescreen.dart';

void main() {
  runApp(Standardchapter());
}

class Standardchapter extends StatefulWidget {
  @override
  _Dropp createState() => _Dropp();
}

class _Dropp extends State<Standardchapter> {
  String item1, item2, item3;
  List listItem = ["Hospital"];
  List name = ["Entry Level NABH 1st time"];
  List company = ["Patient Centered Standards"];
  final Color primaryColor = Colors.teal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Standard_chapter", style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text("Type "),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  value: item1,
                  onChanged: (newValue) {
                    setState(() {
                      item1 = newValue;
                    });
                  },
                  items: listItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("NABH Entry Level "),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  value: item2,
                  onChanged: (newValue) {
                    setState(() {
                      item2 = newValue;
                    });
                  },
                  items: name.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            Text("Standard type"),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  value: item3,
                  onChanged: (newValue) {
                    setState(() {
                      item3 = newValue;
                    });
                  },
                  items: company.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
           Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Standards Chapter Number",
              ),
            ),),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Standards Chapter Code",
              ),)
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Standards Chapter Name",
              ),)
            ),
            SizedBox(height: 10),
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
    );
  }
}
