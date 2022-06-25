import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
//import material dart
import 'package:flutter/material.dart';
import 'package:jobbee/appliedWidget.dart';
import 'package:jobbee/buttom.dart';
//import nav
import 'package:jobbee/nav.dart';
//import model
import 'package:jobbee/model.dart/work.dart';
import 'package:jobbee/provider/userProvider.dart';
import 'package:jobbee/services/appliedService.dart';
import 'package:provider/provider.dart';

class Applied extends StatefulWidget {
  const Applied({Key? key}) : super(key: key);
  static const String routeName = '/applied';
  @override
  State<Applied> createState() => _AppliedState();
}

class _AppliedState extends State<Applied> {
  List<Work>? jobs;
  final AppliedService appliedService = AppliedService();
  @override
  Widget build(BuildContext context) {
    //screen width
    final user = Provider.of<UserProvider>(context).user;

  //  final deviceWidth = MediaQuery.of(context).size.width;
    var date = '2022 / 12 /12';
    List<Work> appliedWork = [
      //work data
      // Work('flutter dev', 'sd', 'logo', 'bkk,thailand'),
      // Work('flutter dev', 'sd', 'logo', 'bkk,thailand'),
      // Work('flutter dev', 'sd', 'logo', 'bkk,thailand'),
      // Work('flutter dev', 'sd', 'logo', 'bkk,thailand'),
    ];
    final TextStyle white = TextStyle(
      color: Colors.white,
    );

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Navbar(),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  //applied work
                  Text('My applied jobs', style: TextStyle(fontSize: 20)),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: user.applied.length,
                      itemBuilder: (context, index) {
                        return AppliedWidget(index: index);
                      })
                ],
              ),
            )),
            Buttom()
          ],
        ),
      ),
    );
  }
}
