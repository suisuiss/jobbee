import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:jobbee/buttom.dart';
import 'package:jobbee/model.dart/work.dart';
import 'package:jobbee/nav.dart';
import 'package:jobbee/provider/userProvider.dart';
import 'package:jobbee/services/appliedService.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_file.dart';

class AppliedWidget extends StatefulWidget {
  const AppliedWidget({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<AppliedWidget> createState() => _AppliedWidgetState();
}

class _AppliedWidgetState extends State<AppliedWidget> {
  final AppliedService appliedService = AppliedService();

  void applied(Work work) {
    appliedService.applied(context: context, work: work);
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final TextStyle white = TextStyle(
      color: Colors.white,
    );
    final applied = context.watch<UserProvider>().user.applied[widget.index];
    final job = Work.fromMap(applied['job']);
    final now = DateFormat.yMd().format(DateTime.now());

     

    return 
      Container(
      height: 170,
      width: deviceWidth  ,
      //margin all
      // margin top
       //padding left right
      padding: EdgeInsets.only(
          left:15, right: 15, top: 15),
       
      margin: EdgeInsets.only(top: 20,
      left: deviceWidth * 0.03, right: deviceWidth * 0.03,
      ),
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
              Image.network(job.images, height: 75, width: 75),
              Container(
                  margin: EdgeInsets.only(right: 5, top: 20),
                  child: 
                  Text(
                    'Applied date:' + now.toString(),
                    style: white,
                  ))
            ],
          ),
          Text(
            job.position,
            style: white,
          ),
          Text(
            job.location,
            style: white,
          ),
          Container(
              //margin all
              height: 19,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(job.fullOrPart))
        ],
      ),
    );
  }
}
