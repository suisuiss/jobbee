import 'dart:convert';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:jobbee/provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jobbee/constant/constant.dart';
import 'package:jobbee/constant/errorhandling.dart';
import 'package:jobbee/constant/utils.dart';
import 'package:jobbee/model.dart/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  void signUpUser(
      {required BuildContext context,
      required images,
      required String firstName,
      required String lastName,
      required String phoneNo,
      required String basedOn,
      required String disType,
      required String edLevel,
      required String eddetail,
      required String workEx,
      required String skill,
      required String email,
      required String password}) async {
    try {
      final cloudinary = CloudinaryPublic('dzxxq4dgq', 'trfqejym');
      List<String> imageUrl = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(images[i].path, folder: firstName));
        imageUrl.add(response.secureUrl);
      }
      User user = User(
          id: '',
          images: imageUrl,
          firstName: firstName,
          lastName: lastName,
          phoneNo: phoneNo,
          basedOn: basedOn,
          disType: disType,
          edLevel: edLevel,
          eddetail: eddetail,
          workEx: workEx,
          skill: skill,
          email: email,
          password: password,
          favorite: [],
          applied: [],token: '');
      http.Response res = await http.post(Uri.parse('$url/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account created!');
            Navigator.pushReplacementNamed(context, '/login');
          });
    } catch (e) {
      //showSnackBar(context, e.toString());
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
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
            Navigator.pushReplacementNamed(context, '/home');
          });
    } catch (e) {
      //showSnackBar(context, e.toString());
    }
  }

  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(Uri.parse('$url/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http.get(Uri.parse('$url/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
     // showSnackBar(context, e.toString());
    }
  }
}
