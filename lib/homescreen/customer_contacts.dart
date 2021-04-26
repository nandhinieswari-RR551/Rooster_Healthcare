import 'package:flutter/material.dart';
import 'package:health/homescreen/main_homescreen.dart';

class Customer extends StatefulWidget {
  @override
  _Dropp createState() => _Dropp();
}

class _Dropp extends State<Customer> {
  String item1, item2, item3;
  List listItem = ["001", "002", "003", "004"];
  List name = ["aaa", "bbb", "ccc"];
  List company = ["NABH", "NACL"];
  final Color primaryColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CEO", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Text("CEO Full Name: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "CEO Full Name",
                      ),

                      /*child: DropdownButton( 
                    dropdownColor: primaryColor,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(), 
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),
                    value: item1,  
                    onChanged: (newValue) {  
                      setState(() {  
                        item1 = newValue;  
                      });  
                    },
                    items: listItem.map((valueItem)
                    {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }
                    ).toList(),
                    ),*/
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("CEO Suffix: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.short_text),
                        labelText: "CEO Suffix",
                      ),
                      /*child: DropdownButton( 
                    dropdownColor: primaryColor,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(), 
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),
                    value: item2,  
                    onChanged: (newValue) {  
                      setState(() {  
                        item2= newValue;  
                      });  
                    },
                    items: name.map((valueItem)
                    {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }
                    ).toList(),
                    ), */
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("CEO Photos: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.image_search),
                        labelText: "CEO Photos",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("CEO Mobile Number: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        labelText: "CEO Mobile Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("CEO WhatsApp Number : "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.message_sharp),
                        labelText: "CEO Whatsapp Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("CEO Telegram Number: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.message),
                        labelText: "CEO Telegram Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Admin Full Name: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "Admin Full Name",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Admin Suffix: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.short_text_outlined),
                        labelText: "Admin Suffix",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Admin Photos: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.photo_library),
                        labelText: "Admin Photos",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Admin Mobile Number: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        labelText: "Admin Mobile Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Admin WhatsApp Number: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.message),
                        labelText: "Admin WhatsApp Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Admin Telegram Number: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.message),
                        labelText: "Admin Telegram Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Quality Manager Full Name: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.contacts),
                        labelText: "Quality Manager Full Name",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Quality Manager Suffix: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.text_format),
                        labelText: "Quality Manager Suffix",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Quality Manager Photos: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.image_outlined),
                        labelText: "Quality Manager Photos",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Quality Manager Mobile Number: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        labelText: "Quality Manager Mobile Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Quality Manager WhatsApp Number: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.messenger_sharp),
                        labelText: "Quality Manager WhatsApp Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Quality Manager Telegram Number: "),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(Icons.messenger),
                        labelText: "Quality Manager Telegram Number",
                      ),
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
