import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Country extends StatefulWidget {
  @override
  _Dropp createState() => _Dropp();
}

final Color primaryColor = Colors.red;

class _Dropp extends State<Country> {
  String getData;
  var cname=TextEditingController();
  var alpha2=TextEditingController();
  var alpha3=TextEditingController();
  var isdcode=TextEditingController();
  var capital=TextEditingController();
  var first="https://rooster-healthcare.herokuapp.com/api/table/Country";
  
  Future insert(String cname, String alpha2, String alpha3, String isdcode, String capital, String tname) async{
  final http.Response res=await http.post("https://rooster-healthcare.herokuapp.com/api/ajax/insert/",
  body: jsonEncode({ "country_name": cname.toString(), "Alpha_2_code":alpha2.toString(), "Alpha_3_code":alpha3.toString(), 
  "ISD_code":isdcode.toString(),"capital": capital.toString(), "table": "Country"}));
  print(res);
  return res;
  }

Future delete(String id) async {
  final http.Response response = await http.delete(
    'https://rooster-healthcare.herokuapp.com/api/ajax/delete/Country/$id',
    
  );
  print(response);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Item Not Deleted!');
  }
}

  Future fetchData() async {
    setState(() {
      isLoading = true;
    });
    final http.Response response = await http.get(first);
    print(response.body);
      final items = json.decode(response.body);
      setState(() {
        this.users=items['a'];
        print(this.users);
        isLoading = false;
      });
  }

  @override 
  void initState(){
    super.initState();
    fetchData();
  }
  bool isLoading=false;
  var users = [];
  
  
  @override
  Widget build(BuildContext context) {   
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Country", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(onPressed: (){
            getBody();
              
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(20) ,
      child:
    ListView.builder(
      itemCount: users.length,
      itemBuilder: (context,index){
      return getCard(users[index]);
    })
      )
    );
    
  }

  Widget getCard(item){
    var cname = item['country_name'];
    var alpha2 = item['Alpha_2_code'];
    var alpha3 = item['Alpha_3_code'];
    var isdcode=item['ISD_code'];
    var capital=item['capital'];
    var id='id';
    return Card(
      color: Colors.grey[200],
      elevation: 10,
      shadowColor: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: 
              Column(    
        children:[
          Row(children: [Text("Alpha_2_code: "),
          Text(alpha2.toString(),),]),       
          Row(children: [
          Text("Alpha_3_code: "),
          Text(alpha3.toString(),),]),      
    
          Row(children: [
          Text("ISD code: "),
          Text(isdcode.toString(),),]),        
          Row(children: [
          Text("Country name: "),
          Text(cname.toString(),),]),       
          Row(children: [
          Text("Capital: "),
          Text(capital.toString(),),]),
          Row(children: [
            SizedBox(width: 100),
            FlatButton(onPressed: (){
           
         },
         color: Colors.green, 
         child: Text("Update"),
         ),
          SizedBox(width: 10),
          FlatButton(onPressed: (){
           delete(id);
         },
         color: Colors.red, 
         child: Text("Delete"),
         )
          ],)
        ]
    ),
        )
      )
    
    );
              
 
  }
getBody(){
  var cname;
    var alpha2;
    var alpha3;
    var isdcode;
    var capital;
    var tname;
    final _formKey = GlobalKey<FormState>();
   return showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 700,
              width: 600,
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.topCenter,
                fit: StackFit.loose,
                children: <Widget>[ Form(
          key: _formKey,
          child: SingleChildScrollView(
          child:Column(
        children: <Widget>[
           SizedBox(height: 25), 
          Text("Add Country",style: TextStyle(fontSize: 18,color: Colors.teal,fontWeight: FontWeight.bold),),
          SizedBox(height: 15),  
          Padding(
        padding: const EdgeInsets.all(10.0),        
          child: Column(children: [
          TextFormField(
            controller: cname,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.black,
                    ),
          border: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.black)
                      //borderSide: const BorderSide(),
                    ),
          hintStyle: TextStyle(color: Colors.black,fontFamily: "WorkSansLight"),
                    filled: true,
                    //fillColor: Colors.teal[500],
                    hintText: 'Country Name',
              
            ),
            onFieldSubmitted: (value) {
                  //Validator
                },
            validator: (value) {
          if (value.isEmpty) {
            return "Country Name is empty";
          }          
        },
          ),
          SizedBox(height: 18),
          TextFormField(
            controller: alpha2,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: Icon(
                      Icons.streetview,
                      color: Colors.black,
                    ),
          border: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.black)
                      //borderSide: const BorderSide(),
                    ),
          hintStyle: TextStyle(color: Colors.black,fontFamily: "WorkSansLight"),
                    filled: true,
                    //fillColor: Colors.teal[500],
                    hintText: 'Alpha 2 Code',
            ),
            onFieldSubmitted: (value) {
                  //Validator
                },
            validator: (value) {
          if (value.isEmpty) {
            return "Alpha 2 Code  is empty";
          }          
        },
          ),
           SizedBox(height: 18),
          TextFormField(
            controller: alpha3,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: Icon(
                      Icons.place,
                      color: Colors.black,
                    ),
          border: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.black)
                      //borderSide: const BorderSide(),
                    ),
          hintStyle: TextStyle(color: Colors.black,fontFamily: "WorkSansLight"),
                    filled: true,
                    //fillColor: Colors.teal[500],
                    hintText: 'Alpha 3 Code',
            ),
            onFieldSubmitted: (value) {
                  //Validator
                },
            validator: (value) {
          if (value.isEmpty) {
            return "Alpha 3 Code is empty";
          }          
        },
          ),


          SizedBox(height: 18),
          TextFormField(
            controller: isdcode,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: Icon(
                      Icons.my_location_outlined,
                      color: Colors.black,
                    ),
          border: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.black)
                      //borderSide: const BorderSide(),
                    ),
          hintStyle: TextStyle(color: Colors.black,fontFamily: "WorkSansLight"),
                    filled: true,
                    //fillColor: Colors.teal[500],
                    hintText: 'ISD Code',
            ),
            onFieldSubmitted: (value) {
                  //Validator
                },
            validator: (value) {
          if (value.isEmpty) {
            return "ISD Code is empty";
          }          
        },
          ),

          SizedBox(height: 18),
          TextFormField(
            controller: capital,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: Icon(
                      Icons.near_me,
                      color: Colors.black,
                    ),
          border: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.black)
                      //borderSide: const BorderSide(),
                    ),
          hintStyle: TextStyle(color: Colors.black,fontFamily: "WorkSansLight"),
                    filled: true,
                    //fillColor: Colors.teal[500],
                    hintText: 'Capital',
            ),
            onFieldSubmitted: (value) {
                  //Validator
                },
            validator: (value) {
          if (value.isEmpty) {
            return "Capital is empty";
          }          
        },
          ),
          RaisedButton(
            child: Text('Save', style: TextStyle(color: Colors.white)),
            onPressed: () {
              _formKey.currentState.validate();
              //Navigator.push(context,                  MaterialPageRoute(builder: (context) => HomeScreen()));
              insert( cname, alpha2,  alpha3, isdcode, capital,tname);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: Colors.teal[900],
          ),
        ]),
      )
                  ]  )
            
      )
                 )   ])
              
      ))
          );
}
}