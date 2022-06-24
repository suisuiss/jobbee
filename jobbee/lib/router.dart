import 'package:flutter/material.dart';
import 'package:jobbee/account.dart';
import 'package:jobbee/applied.dart';
import 'package:jobbee/homeScreen.dart';
import 'package:jobbee/loginScreen.dart';
import 'package:jobbee/model.dart/work.dart';
import 'package:jobbee/register.dart';
import 'package:jobbee/searchResult.dart';
import 'package:jobbee/view/ProfilePage.dart';
import 'package:jobbee/view/jobDetail.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AccountPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AccountPage(),
      );

    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case RegisterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

    case Applied.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const Applied());

    case SearchResult.routeName:
      //var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SearchResult());
    case JobDetail.routeName:
      var work = routeSettings.arguments as Work;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => JobDetail(
          work: work,
        ),
      );
    case ProfilePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ProfilePage());

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text(''),
          ),
        ),
      );
  }
}



  //   '/': (context) => AccountPage(),
      //   '/login': (context) => LoginScreen(),
      //   '/signup': (context) => RegisterScreen(),
      //   '/home': (context) => HomeScreen(),
      //   '/testhome': (context) => HomeContent(),
      //   '/applied': (context) => Applied(),
      //   '/search': (context) => SearchResult(),
      //   '/test': (context) => HomeContent(),
      //   '/profile': (context) => ProfilePage(),