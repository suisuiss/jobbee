import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jobbee/buttom.dart';
import 'package:jobbee/model.dart/job.dart';
import 'package:jobbee/model.dart/work.dart';
import 'package:jobbee/nav.dart';
import 'package:jobbee/searchWidget.dart';
import 'package:jobbee/services/homeService.dart';
import 'package:jobbee/services/searchService.dart';
import 'package:jobbee/view/jobDetail.dart';

class SearchResult extends StatefulWidget {
  static const String routeName = '/search';
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<Work>?works;
  final HomeService homeService = HomeService();
  List<Job> jobs = [];
  String query = '';
  Timer? deboucer;

  @override
  void initState() {
    super.initState();
    init();
    fetchAllWork();
  }

   

  fetchAllWork() async {
    works = await homeService.fetchAllWorks(context);
    setState(() {});
  }

  @override
  void dispose() {
    deboucer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1),
  }) {
    if (deboucer != null) {
      deboucer!.cancel();
    }
    deboucer = Timer(duration, callback);
  }

  Future init() async {
    final jobs = await SearchService.getJobs(query);
    setState(() => this.jobs = jobs);
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom == 0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                final work = works![index];
                return GestureDetector(
        onTap: () => {
          Navigator.pushNamed(context, '/jobDetail', arguments: work),
        },
        child: ListTile(
          leading: Image.network(
            job.images,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          title: Text(job.position),
          subtitle: Text(job.companyName + ' ' + job.location),
        ),
      );
              },
            ),
          ),
          isKeyboardOpen ? Buttom() : Container()
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search For Job Position',
        onChanged: searchJob,
      );

  Future searchJob(String query) async => debounce(() async {
        final jobs = await SearchService.getJobs(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.jobs = jobs;
        });
      });

  
}

  // @override
  // Widget build(BuildContext context) {
  //   //screen height
  //   //text controller
  //   final TextEditingController _result = TextEditingController();
  //   final TextStyle textStyle = TextStyle(
  //     fontSize: 18,
  //     //fontweight
  //     fontWeight: FontWeight.w500,
  //   );
  //   final deviceHeight = MediaQuery.of(context).size.height;
  //   final deviceWidth = MediaQuery.of(context).size.width;
  //   final InputDecoration textFormstyle = InputDecoration(
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20))),
  //   );

  //   return Scaffold(
  //     body: Container(
  //       child: Column(
  //         children: [
  //           //sreach and filter
  //           Container(
  //             height: deviceHeight * 0.13,
  //             padding: EdgeInsets.only(left: 20, right: 20, top: 10),
  //             child: Row(
  //               children: [
  //                 GestureDetector(
  //                   onTap: () {
  //                     //print clicked
  //                     print('as');
  //                   },
  //                   child: Icon(
  //                     Icons.arrow_back_ios,
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 20,
  //                 ),
  //                 Expanded(
  //                     child: TextFormField(
  //                   //border
  //                   controller: _result,
  //                   decoration: textFormstyle.copyWith(
  //                     hintText: 'Search',
  //                   ),
  //                 )),
  //                 //filter icon

  //                 GestureDetector(
  //                   onTap: () {
  //                     //print clicked
  //                     //show dialog
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Icon(
  //                       Icons.tune,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           //search result
  //           SingleChildScrollView(
  //             child: Container(
  //               //padding all
  //               padding: EdgeInsets.all(20),
  //               child: Column(
  //                 //cross alignment start

  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         'Result',
  //                         //font size
  //                         style: TextStyle(fontSize: 15),
  //                       )
  //                     ],
  //                   ),
  //                   //sizedd box height 20
  //                   SizedBox(
  //                     height: 10,
  //                   ),

  //                   //result list
  //                   //for here
  //                   Container(
  //                     decoration: BoxDecoration(
  //                         color: Colors.grey,
  //                         borderRadius: BorderRadius.all(Radius.circular(20))),
  //                     height: 70,
  //                     //padding all
  //                     padding: EdgeInsets.all(10),
  //                     child: Row(
  //                       children: [
  //                         //image asset
  //                         Image.asset('assets/jobbee.png',
  //                             height: 50, width: 50),
  //                         //sized box width 20
  //                         SizedBox(
  //                           width: 10,
  //                         ),
  //                         Column(
  //                           crossAxisAlignment: CrossAxisAlignment.center,
  //                           children: [
  //                             Text('job position', style: textStyle),
  //                             Text('job location',
  //                                 style: textStyle.copyWith(
  //                                     fontWeight: FontWeight.w300))
  //                           ],
  //                         )
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
              