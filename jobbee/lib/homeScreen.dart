import 'package:flutter/material.dart';
import 'package:jobbee/model.dart/work.dart';
//import navbar
import 'package:jobbee/nav.dart';
//import buttom
import 'package:jobbee/buttom.dart';
//import work model
import 'package:jobbee/provider/loader.dart';
import 'package:jobbee/provider/userProvider.dart';
import 'package:jobbee/services/homeService.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Work>? jobs;
  final HomeService homeService = HomeService();
  final InputDecoration textFormstyle = InputDecoration(
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
  );
  //Textcontroller for search
  final TextEditingController _search = TextEditingController();
  //create fromkey
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchAllWork();
  }

  fetchAllWork() async {
    jobs = await homeService.fetchAllWorks(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom == 0;

    List<Work> workData = [
      // Work('flutter dev', 'sd', 'logo', 'bkk,thailand'),
      // Work('flutter dev', 'sd', 'logo', 'bkk,thailand'),
      // Work('flutter dev', 'sd', 'logo', 'bkk,thailand'),
      // Work('flutter dev', 'sd', 'logo', 'bkk,thailand'),
    ];
    final user = Provider.of<UserProvider>(context).user;
    //device width
    final deviceWidth = MediaQuery.of(context).size.width;
    return jobs == null
        ? const Loader()
        : Scaffold(
            body: Container(
              child: Column(
                children: [
                  Navbar(),
                  Expanded(
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Container(
                        height: 60,
                        child: Padding(
                          //padding left
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Hello '+ user.firstName+' '+ user.lastName,
                                  ),
                                  TextSpan(
                                    text: '\nFind your dream job!',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // searchBox(),
                      banner(),
                      fav(workData),
                    ])),
                  ),
                  isKeyboardOpen ? Buttom() : Container(),
                ],
              ),
            ),
          );
  }
  
  
  Widget banner() {
    final TextStyle white = TextStyle(color: Colors.white, fontSize: 15);
    final jobData = jobs!;
    return jobs == null
        ? const Loader()
        : 
        


        Container(
            height: 200,
            child: PageView(
              children: [
                for (int i=0; i<3; i++)
                Container(             
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    //border radius 20
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: Color.fromARGB(255, 10, 57, 96),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      //cross align
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        //1st

                        GestureDetector(
                          onTap: () => {
                            print (jobData[i].id),
                            //print type of jobData
                            // print(jobData.runtimeType),
                            // print(jobs.runtimeType),
                            // print(jobData.id.runtimeType),
                            //navigate push name to jobdetail page
                            Navigator.pushNamed(context, '/jobDetail',
                            arguments: jobData[i].id
                            ),

                          },
                          child: Row(
                            //space between
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(jobData[i].images,
                                  height: 75, width: 75),
                              Container(
                                  margin: EdgeInsets.only(right: 20, top: 20),
                                  child: Text(
                                    jobData[i].salary,
                                    style: white,
                                  ))
                            ],
                          ),
                        ),
                        Text(
                          jobData[i].position,
                          style: white,
                        ),

                        Text(
                          jobData[i].location,
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
                            child: Text(jobData[i].fullOrPart))
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }

  Widget searchBox() {
    //
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: textFormstyle.copyWith(
            hintText: 'Search your dream job',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  Widget fav(workData) {
    final TextStyle style = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            //padding left
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.07,
                bottom: 10,
                top: 10),
            child: Align(
              //padding left

              alignment: Alignment.centerLeft,
              child: Text('Your favourite jobs',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,
                    //Text align left
                  )),
            ),
          ),
          for (var item in workData)
            Row(
              children: [
                Container(
                  //color grey

                  width: MediaQuery.of(context).size.width * 0.86,
                  //padding 8
                  //margin left and right
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07,
                    top: 10,
                  ),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(

                      //border radius 20
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromARGB(255, 219, 219, 219)),
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/Icon.png',
                          height: 65,
                          width: 65,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //cross align
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: style,
                            ),
                            Text(
                              item.location,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
        ],
      ),
    ));
  }
}
//create banner widget class