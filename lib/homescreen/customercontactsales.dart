import 'package:flutter/material.dart';
import 'package:health/homescreen/main_homescreen.dart';

class Customercontactsales extends StatefulWidget {
  @override
  _Dropp createState() => _Dropp();
}

class _Dropp extends State<Customercontactsales> {
  String item1, item2, item3;
  List listItem = [""];

  List quality = [
    "Entry Level NABH 1st time",
    "Entry Level NABH 2nd time",
    "JCI",
    "NABL"
  ];
  List element = ["Documentation/Manuals"];
  final Color primaryColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Contract Status",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text("Contract Status Code"),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
            SizedBox(height: 20),
            Text("Contract Status Name"),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                  items: quality.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            Text("Contract Status Notes"),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                  items: element.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            /*TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Judgement element description",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Standards Chapter Code",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Standards Chapter Name",
              ),
            ),*/
            SizedBox(height: 15),
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
