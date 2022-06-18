import 'package:flutter/material.dart';
import 'package:jobbee/provider/userProvider.dart';
import 'package:jobbee/view/jobDetail.dart';
import 'package:provider/provider.dart';
import '../view/ProfilePage.dart';
import 'package:jobbee/account.dart';
import 'package:jobbee/applied.dart';
import 'package:jobbee/home.dart';
import 'package:jobbee/loginScreen.dart';
//import home screen
import 'package:jobbee/homeScreen.dart';
import 'package:jobbee/register.dart';
import 'package:jobbee/searchResult.dart';

var blue = Color.fromRGBO(57, 172, 231, 100);

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove dubug banner
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AccountPage(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/testhome': (context) => HomeContent(),
        '/applied': (context) => Applied(),
        '/search': (context) => SearchResult(),
        '/test': (context) => HomeContent(),
        '/profile': (context) => ProfilePage(),
        '/jobDetail': (context) => jobDetail(),
      },
    );
  }
}
