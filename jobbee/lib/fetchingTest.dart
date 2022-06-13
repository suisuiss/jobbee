import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jobbee/buttom.dart';
import 'package:jobbee/model.dart/work.dart';
//get http
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:jobbee/constant/constant.dart';
import 'package:jobbee/constant/errorhandling.dart';
import 'package:jobbee/constant/utils.dart';
import 'package:jobbee/model.dart/work.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    //initState
    
    List<Work>workData  = [
      Work(id: "123", companyName: "adidass", images: 'asd', position: 'asd', salary: 'asd', fullOrPart: 'asd', online:'asd', jobRes: 'asd', benefits: 'asd', companyDesc: 'asd', location:'asdasd'),
      Work(id: "123", companyName: "adidass", images: 'asd', position: 'asd', salary: 'asd', fullOrPart: 'asd', online:'asd', jobRes: 'asd', benefits: 'asd', companyDesc: 'asd', location:'asdasd')
    ];
    initState(){
      
      print('asd');
      
       
      
    }
    Future<Work> fetch() async {
  final response = await http
      .get(Uri.parse('$url/api/home-job'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Work.fromJson(jsonDecode(response.body));
    print('fectched');
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
    return Scaffold(
      body:
      Center(
        child: 
        Column(
          children: [
            Text('asd'),
            //button with onclick
            GestureDetector(
              child: Text('click me'),
              onTap:()=>{
                fetch()
              }
            )
          ],
        ),
      )
    );
  }
}