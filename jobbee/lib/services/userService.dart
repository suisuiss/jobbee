import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jobbee/homeScreen.dart';
import 'package:jobbee/provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobbee/constant/constant.dart';
import 'package:jobbee/constant/errorhandling.dart';
import 'package:jobbee/constant/utils.dart';
import 'package:jobbee/model.dart/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  void signUpUser(
      {required BuildContext context,
      required String image,
      required String firstName,
      required String lastName,
      required String phoneNo,
      required String basedOn,
      required String edLevel,
      required String eddetail,
      required String workEx,
      required String skill,
      required String email,
      required String password}) async {
    try {
      User user = User(
          id: '',
          image: image,
          firstName: firstName,
          lastName: lastName,
          phoneNo: phoneNo,
          basedOn: basedOn,
          edLevel: edLevel,
          eddetail: eddetail,
          workEx: workEx,
          skill: skill,
          email: email,
          password: password);
      http.Response res = await http.post(Uri.parse('$url/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context,
                'Account created! Login with the same email and password');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void loginUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(Uri.parse('$url/api/login'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      print(res.body);
      httpErrorHandle(response: res, 
      context: context, 
      onSuccess: () async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
