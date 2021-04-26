import 'package:flutter/material.dart';
import 'package:health/homescreen/main_homescreen.dart';

class Business extends StatefulWidget {
  @override
  _Dropp createState() => _Dropp();
}

final Color primaryColor = Colors.red;

class _Dropp extends State<Business> {
  String item1, item2, item3, item4;
  List listItem = ["001", "002", "003", "004"];
  List name = ["aaa", "bbb", "ccc"];
  List company = ["NABH", "NABL", "JCI"];
  List notes = ["aaa", "bbb", "ccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Category", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Text("Business Code: "),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton(
                // dropdownColor: primaryColor,
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
          Text("Business ownership: ",textAlign: TextAlign.left,),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton(
                //dropdownColor: primaryColor,
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
          //SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.business_center),
              labelText: "Business Category Name: ",
            ),
          ),
        ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.add_business),
              labelText: "Business Category Notes: ",
            ),
          ),),

          SizedBox(height: 18),

          RaisedButton(
            child: Text('Save', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: Colors.teal,
          ),
        ],
      ),
    );
  }
}
