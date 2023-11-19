import 'package:flutter/material.dart';
import 'package:sign_language_detection/pages/login.dart';
import 'package:sign_language_detection/pages/register.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor:  Color.fromARGB(255, 241, 139, 6),
      //primarySwatch: Colors.indigo
    ),
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}