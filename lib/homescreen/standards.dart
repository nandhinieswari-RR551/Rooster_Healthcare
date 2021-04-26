import 'package:flutter/material.dart';


class Standards  extends StatefulWidget {
  Standards({Key key}) : super(key: key);

  @override
  _StandardsState createState() => _StandardsState();
}

class _StandardsState extends State<Standards> {
  var _expand = false;
  final _formKey = GlobalKey<FormState>();  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          color: Colors.grey[200],
          elevation: 5,
          child: AnimatedContainer(
            width: 150,
            height: _expand ? 300 : 150,
            duration: Duration(milliseconds: 200),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => _standardChapters()));
              
            });
          },
          onLongPress: () {
            setState(() {
              // TODO : Standards options....
            });
          },
          child: Card(
            color: Colors.white,
            elevation: 5,
            child: Container(
              width: 150,
              height: 150,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Standards",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

_standardChapters(){
return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    appBar: AppBar(title: Text("Standard Chapters"),
    backgroundColor: Colors.green,
      actions: [        
      Icon(Icons.search),     
      Icon(Icons.logout),
      
    ],
        ),
    
    body: Form(  
      key: _formKey,  
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: <Widget>[  
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Business Category',  
              labelText: 'Business Category',  
            ),  
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.format_list_numbered),  
              hintText: 'Standard Type',  
              labelText: 'Standard Type',  
            ),  
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.confirmation_number), 
            hintText: 'Standard Chapter Number',  
            labelText: 'Standard Chapter Number',  
            ),  
           ),  
          new Container(  
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: new RaisedButton(  
                child: const Text('Submit'),  
                  onPressed: null,  
              )),  
        ],  
      ),  
     
    ),
 

drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://4.bp.blogspot.com/-k_6MWSkqHGA/Vvjf2FLElYI/AAAAAAAADmI/-mlJRMHLhMMFA0sW-tDdhBqn1SnMvLB_Q/s1600/dfdfddfd.jpg'))),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
            leading: Icon(Icons.contacts),           
            title: Text('Product Owner'),
             ),
             ListTile(
            leading: Icon(Icons.admin_panel_settings),
                      title: Text(' Super Admin'),
             ),
             ListTile(
            leading: Icon(Icons.emoji_people),
                        title: Text('Admin'),
             ),
            ListTile(
            leading: Icon(Icons.person),
                        title: Text('Consultants'),
             ),
             ListTile(
            leading: Icon(Icons.people),
                        title: Text('Management Team'),
             ),
             ListTile(
            leading: Icon(Icons.nature_people_outlined),
                        title: Text('Administration Team'),
             ),
             ListTile(
            leading: Icon(Icons.photo_library),
                        title: Text('Quality Team'),
             ),
             ListTile(
            leading: Icon(Icons.outbox),
                        title: Text('Review Team'),
             ),
             ListTile(
            leading: Icon(Icons.pages_outlined),
                        title: Text('Assessment Team'),
             )
            ],
          ),
        ),
      ),
    );

  }
}


  

  

