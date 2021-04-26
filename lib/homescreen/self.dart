import 'package:flutter/material.dart';
import 'package:health/homescreen/main_homescreen.dart';

void main() {
  runApp(Self());
}

class Self extends StatefulWidget {
  @override
  _Dropp createState() => _Dropp();
}

class _Dropp extends State<Self> {
  String item1, item2, item3;
  List listItem = [
    "Hospitals",
    "Clinic",
    "PHC",
  ];
  List name = ["01", "02", "03", "04", "05"];
  List company = ["AAC.1", "AAC.2", "AAC.3", "AAC.4"];
  final Color primaryColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Self Assessment Tool Kit Template",
            style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Text("Business Category "),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton(
                dropdownColor: primaryColor,
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
          Text("Standards Chapter Number "),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton(
                dropdownColor: primaryColor,
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
          SizedBox(height: 20),
          Text("Standards Sub-Chapter Code "),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton(
                dropdownColor: primaryColor,
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
          SizedBox(height: 15),
          RaisedButton(
            child: Text('Save', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
