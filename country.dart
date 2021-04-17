import 'package:flutter/material.dart';
import 'package:health/homescreen/main_homescreen.dart';
import 'package:http/http.dart' as http;

class Country extends StatefulWidget {
  @override
  _Dropp createState() => _Dropp();
}

final Color primaryColor = Colors.red;

class _Dropp extends State<Country> {
  String getData;

  Future fetchData() async{
    http.Response response;
    response = await http.get("https://rooster-healthcare.herokuapp.com/api/table/Country");
    print(response.body);

    if(response.statusCode==200){
      setState((){
        getData = response.body;
      });
    }
  }

  @override 
  void initState(){
    super.initState();
    fetchData();
  }
  bool isLoading=false;
  List users = [];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country", style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
      ),
      body: Padding(padding: const EdgeInsets.all(20) ,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          //SizedBox(height:20),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.note),
              labelText: "Country name: ",
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.note),
              labelText: "Country Code: ",
            ),
          ),

          SizedBox(height: 18),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.note),
              labelText: "ISO Code: ",
            ),
          ),

          SizedBox(height: 18),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.note),
              labelText: "Capital: ",
            ),
          ),

          SizedBox(height: 18),

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
          SizedBox(height: 18),

          RaisedButton(
            child: Text('Display', style: TextStyle(color: Colors.white)),
            onPressed: () {
              getBody();
              },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: primaryColor,
          ),
        ],
      ),
      )
    );
  }
  Widget getBody(){
   /* if(users.contains(null) || users.length < 0 || isLoading){
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.pinkAccent)));
    }*/
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context,index){
      return getCard(users[index]);
    });
  }

  Widget getCard(item){
    var cname = item['country_name'];
    var alpha2 = item['Alpha_2_code'];
    var alpha3 = item['Alpha_3_code'];
    var isdcode=item['ISD_code'];
    var capital=item['capital'];
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width-140,
                    child: Text(cname.toString(),)),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width-140,
                    child :Text(alpha2.toString()),),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width-140,
                    child: Text(alpha3.toString(),)),
                  SizedBox(height: 10,),
                  
                  SizedBox(
                    width: MediaQuery.of(context).size.width-140,
                    child :Text(isdcode.toString(),),),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width-140,
                    child :Text(capital.toString(),),),
                  SizedBox(height: 10,),
                ],
              )
            
          ),
        ),
      
    );
 
  }

}
