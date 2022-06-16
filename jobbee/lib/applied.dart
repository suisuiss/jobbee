import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
//import material dart
import 'package:flutter/material.dart';
import 'package:jobbee/buttom.dart';
//import nav
import 'package:jobbee/nav.dart';
//import model
import 'package:jobbee/model.dart/work.dart';

class Applied extends StatefulWidget {
  const Applied({Key? key}) : super(key: key);

  @override
  State<Applied> createState() => _AppliedState();
}

class _AppliedState extends State<Applied> {
  @override
  Widget build(BuildContext context) {
    //screen width
    final deviceWidth = MediaQuery.of(context).size.width;
    var date = '2020-01-01';
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
                  for (var i in appliedWork)
                    Container(
                      height: 170,
                      width: deviceWidth * 0.72,
                      //margin all
                      // margin top
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 10, 57, 96),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            //space between
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/locowithname.png',
                                  height: 75, width: 75),
                              Container(
                                  margin: EdgeInsets.only(right: 20, top: 20),
                                  child: Text(
                                    'Applied date:' + date,
                                    style: white,
                                  ))
                            ],
                          ),
                          Text(
                            'Flutter Developer',
                            style: white,
                          ),
                          Text(
                            'Bangkok,thailand',
                            style: white,
                          ),
                          Container(
                              //margin all
                              height: 19,
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Text('Fulltime'))
                        ],
                      ),
                    )
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
