import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobbee/applied.dart';
import 'package:jobbee/buttom.dart';
import 'package:jobbee/homeScreen.dart';
import 'package:jobbee/nav.dart';
import 'package:jobbee/searchResult.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final screenList = [HomeScreen(), SearchResult(), Applied()];

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom == 0;
    var index = 1;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            isKeyboardOpen ? Buttom() : Container(),
          ],
        ),
      ),
    );
  }
}
