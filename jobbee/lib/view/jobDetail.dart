import 'package:flutter/material.dart';
import '../modell/company.dart';
import './CompanyTab.dart';
import './DescriptionTab.dart';

class jobDetail extends StatelessWidget {
  const jobDetail({Key? key}) : super(key: key);
  final company = CompanyInfo.myCompany;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          company.companyName,
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
                            image: NetworkImage(company.imagepath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      company.job,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF21202A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      company.sallary,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF21202A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 25.0),
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
                    DescriptionTab(),
                    CompanyTab(),
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
                child: Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
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

                                ScaffoldMessenger.of(context).showSnackBar(
                                    //duration 2
                                    //green snackbar


                                    SnackBar(
                                      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
                                 //floating behaviour
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.blue,
                                  duration: Duration(seconds: 2),
                                  content: Text('application sent!',
                                  textAlign: TextAlign.center
                                  ,style: TextStyle(
                                    fontSize: 20,
                                    

                                    //textalign center

                                  ),),
                                ));
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
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
}
