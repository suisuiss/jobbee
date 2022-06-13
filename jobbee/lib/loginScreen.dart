import 'package:flutter/material.dart';
import 'package:jobbee/account.dart';
import 'package:jobbee/homeScreen.dart';
import 'package:jobbee/main.dart';
import 'package:http/http.dart' as http;
import 'package:jobbee/services/userservice.dart';

var blue = Color.fromRGBO(57, 172, 231, 100);

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final UserService userService = UserService();
  final InputDecoration textFormstyle = InputDecoration(
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
  );

  void loginUser() {
    userService.loginUser(
        context: context, email:_email.text, password: _pass.text);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        logo(),
                        SizedBox(height: 40),
                        Column(
                          children: [
                            Container(
                              width: deviceWidth * 0.7,
                              child: TextFormField(
                                autofocus: true,
                                controller: _email,
                                validator: (email) {
                                  var emailReg = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                  if (email == null || email.isEmpty) {
                                    return 'Please enter a username';
                                    // !email.contains('@')
                                  } else if (!emailReg.hasMatch(email)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                decoration:
                                    textFormstyle.copyWith(labelText: 'Email'),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: deviceWidth * 0.7,
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: _pass,
                                obscureText: true,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please enter a password';
                                  } else if (val.length <= 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
                                decoration: textFormstyle.copyWith(
                                    labelText: 'Password'),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            width: deviceWidth * 0.5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: blue,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 16),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    loginUser();
                                  } 
                                },
                                child: Text('Log in',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                            )),
                      ],
                    ))))));
  }

  Widget button(deviceWidth) {
    return Container(
      height: 50,
      width: deviceWidth * 0.5,
      child: RaisedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            loginUser();
          } 
        },
        color: blue,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          'LOGIN',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget logo() {
    return Image(
      image: AssetImage('assets/Icon.png'),
      width: 100,
      height: 100,
    );
  }
}
