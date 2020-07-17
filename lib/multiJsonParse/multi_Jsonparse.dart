
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MultiJsonParse extends StatelessWidget
{
  Future<String> _loaddata() async
  {
   // return await http.loadString("https://api.mockaroo.com/api/b00bdb30?count=50&key=af63fef0");
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Text("data"),
  );
  }

}