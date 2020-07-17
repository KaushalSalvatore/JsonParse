
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/jsonParse/CustomAppBar.dart';
import 'package:flutter_tutorial/jsonParse/users.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget
{
  HomePage({Key key,this.title}): super(key:key);
  final String title;

  @override
  _MyHomePage createState() => new _MyHomePage();

}

 class _MyHomePage extends State<HomePage>
{
  List<User> users = [];
  Future<List<User>> _getUsers() async
  {
   var data = await http.get("https://api.mockaroo.com/api/b00bdb30?count=50&key=af63fef0");
   var jsonData = json.decode(data.body);


  for(var u in jsonData)
    {
      User user = User(u["id"],u["first_name"],u["last_name"],u["email"],u["gender"],u["ip_address"],u["image"]);
      users.add(user);
      print(users.length);

    }
   return users;
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SingleChildScrollView(
       child: Column(
         children: <Widget>[
           CustomAppBar(),
           FutureBuilder(
             future: _getUsers(),
             builder: (BuildContext context ,  AsyncSnapshot snapshot){
    if (snapshot.data != null) {
    return Container(
    height: MediaQuery.of(context).size.height,
    color: Color(0xfffF7F7F7),
    child: ListView.builder(
    itemCount: snapshot.data.length,
    itemBuilder: (BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(snapshot.data[index].image),
      ),

      title: Text(snapshot.data[index].id),
      subtitle: Text(snapshot.data[index].email),
    );
    },
    ),

    );
    }
    else {
    return Container(
    child: Center(
    child: Text("Loading"),
    ),
    );
    }
             },
           ),
         ],
       ),
     ),
   );
  }
}


