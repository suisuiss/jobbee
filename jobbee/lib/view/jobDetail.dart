import 'package:flutter/material.dart';
import 'package:jobbee/applied.dart';
import 'package:jobbee/provider/userProvider.dart';
import 'package:jobbee/model.dart/work.dart';
import 'dart:convert';
import 'package:jobbee/constant/constant.dart';
import 'package:jobbee/constant/errorhandling.dart';
import 'package:jobbee/constant/utils.dart';
import 'package:http/http.dart' as http;
import 'package:jobbee/services/appliedService.dart';
import 'package:jobbee/services/favoriteService.dart';
import 'package:provider/provider.dart';
//import blue from instant

final blue = Color.fromRGBO(57, 172, 231, 100);

class JobDetail extends StatefulWidget {
  const JobDetail({Key? key, required this.work}) : super(key: key);
  final Work work;
  static const String routeName = '/jobDetail';
  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  final FavoriteService favoriteService = FavoriteService();
  final AppliedService appliedService = AppliedService();

  @override
  Work? JobDetail;
  int number = 0;
  Future<Work> GetJobById(BuildContext context) async {
    final JobId = ModalRoute.of(context)!.settings.arguments as Work;

    Work? jobData;
  //   try {
  //     http.Response res = await http.get(Uri.parse('$url/api/job/' + JobId.toString()),
  //         headers: {'Content-Type': 'application/json; charset=UTF-8'});
  //     httpErrorHandle(
  //         response: res,
  //         context: context,
  //         onSuccess: () {
  //           // for (int i = 0; i < jsonDecode(res.body).length; i++) {
  //           //   JobDett.add(Work.fromJson(jsonEncode(jsonDecode(res.body)[i])));
  //           // }

  //           jobData = Work.fromJson(jsonEncode(jsonDecode(res.body)));
  //           setState(() {
  //             JobDetail = jobData;
  //           });
  //         });
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
    return JobId;
  }

  @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    super.dispose();
    //calling dependOninheritedWidget() to dispose the widget
  }

  void favorite() {
    favoriteService.favorite(context: context, work: widget.work);
  }

  fetchAllWork() async {
    JobDetail = await GetJobById(context);
    setState(() {});
  }

  Widget build(BuildContext context) {
    final userFav = context.watch<UserProvider>().user.favorite.length;
    final jobId = ModalRoute.of(context)!.settings.arguments as Work;
    final jobDe = JobDetail;
    fetchAllWork();
    setState(() {
      number = 123;
    });

    return jobDe == null
        ? Scaffold(
            body: Center(
              child: Text(
                jobDe.toString(),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF21202A),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                jobDe.companyName,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF21202A),
                  fontWeight: FontWeight.w400,
                ),
              ),
              centerTitle: true,
            ),
            body: DefaultTabController(
              length: 2,
              child: Container(
                width: double.infinity,
                // margin: EdgeInsets.only(top: 50.0),
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(maxHeight: 250.0),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: NetworkImage(jobDe.images),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            jobDe.position,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF21202A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            jobDe.salary,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF21202A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Center(
                            child: Container(
                                decoration: BoxDecoration(
                                  // border circular
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color.fromARGB(255, 223, 223, 223),
                                ),
                                height: 23,
                                width: 100,
                                child: Text(
                                  jobDe.fullOrPart,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                          SizedBox(height: 15.0),
                          Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(
                                color: Color(0xFF21202A).withOpacity(.2),
                              ),
                            ),
                            // borderRadius: BorderRadius.circular(12.0),
                            child: TabBar(
                              unselectedLabelColor: Color(0xFF21202A),
                              indicator: BoxDecoration(
                                color: Color.fromARGB(255, 32, 168, 241),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              tabs: [
                                Tab(text: "Description"),
                                Tab(text: "Company"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Des(jobDe),
                          Comp(jobDe),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: Container(
                padding: EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
                // margin: EdgeInsets.only(bottom: 25.0),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black.withOpacity(.5)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: IconButton(
                          icon: Icon(Icons.favorite),
                          color: Colors.blue,
                          onPressed: favorite),
                    ),
                    SizedBox(width: 15.0),
                    Expanded(
                      child: SizedBox(
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            //show dialog

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Confirm"),
                                content: Text(
                                    "Are you sure you want to apply for this job?"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text("Apply"),
                                    onPressed: () {
                                      Navigator.pop(context);

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              //duration 2
                                              //green snackbar

                                              SnackBar(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        //floating behaviour
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.blue,
                                        duration: Duration(seconds: 2),
                                        content: Text(
                                          'application sent!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,

                                            //textalign center
                                          ),
                                        ),
                                      ));
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            "Apply for Job",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF21202A),
                              fontWeight: FontWeight.w400,
                            ).copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Widget Des(JobDe) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          Text(
            "Job Responsibilities",
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF21202A),
              fontWeight: FontWeight.w400,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            JobDe.jobRes,
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF21202A),
            ).copyWith(
              fontWeight: FontWeight.w300,
              height: 1.5,
              color: Color(0xFF5B5B5B),
            ),
          ),
          SizedBox(height: 25.0),
          Text(
            "Benefits",
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF21202A),
              fontWeight: FontWeight.w400,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            JobDe.benefits,
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF21202A),
            ).copyWith(
              fontWeight: FontWeight.w300,
              height: 1.5,
              color: Color(0xFF5B5B5B),
            ),
          ),
        ],
      ),
    );
  }

  Widget Comp(jobDe) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          // ignore: prefer_const_constructors
          Text(
            "About Company",
            style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(jobDe.companyDesc,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                height: 1.5,
                color: Color(0xFF5B5B5B),
              )),
        ],
      ),
    );
  }
}
 
//

   
 
 