import 'package:flutter/material.dart';
import 'package:jobbee/account.dart';
import 'package:jobbee/applied.dart';
import 'package:jobbee/buttom.dart';
import 'package:jobbee/fetchingTest.dart';
import 'package:jobbee/loginScreen.dart';
//import home screen
import 'package:jobbee/homeScreen.dart';
import 'package:jobbee/nav.dart';
import 'package:jobbee/searchResult.dart';

var blue = Color.fromRGBO(57, 172,231, 100);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      LoginScreen(),

    );
  }
}
 
