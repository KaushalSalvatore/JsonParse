
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/jsonParse/homepage.dart';

class Getdata extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return new MaterialApp(
      title: 'flutter Demo',
     theme: ThemeData(primarySwatch: Colors.blue),
     home: new HomePage(title : 'Users'),
   );
  }
}
