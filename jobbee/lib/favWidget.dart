import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jobbee/model.dart/work.dart';
import 'package:jobbee/provider/userProvider.dart';
import 'package:jobbee/services/favoriteService.dart';
import 'package:jobbee/view/jobDetail.dart';
import 'package:provider/provider.dart';

class Favwidget extends StatefulWidget {
  const Favwidget({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<Favwidget> createState() => _FavwidgetState();
}

class _FavwidgetState extends State<Favwidget> {
  final FavoriteService favoriteService = FavoriteService();

  void favJob(Work work) {
    favoriteService.favorite(context: context, work: work);
  }

  @override
  Widget build(BuildContext context) {
    final favJob = context.watch<UserProvider>().user.favorite[widget.index];
    final job = Work.fromMap(favJob['job']);
    final TextStyle style = TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
    return Center(
        child: Container(
      child: Column(
        children: [
          Padding(
            //padding left
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.07,
                bottom: 5,
                top: 0),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => {
                  //navigate push name to jobdetail page
                  Navigator.pushNamed(context, JobDetail.routeName,
                      arguments: job),
                },
                child: Container(
                  //color grey

                  width: MediaQuery.of(context).size.width * 0.86,
                  //padding 8
                  //margin left and right
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.07,
                      right: MediaQuery.of(context).size.width * 0.07,
                      bottom: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(

                      //border radius 20
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromARGB(255, 219, 219, 219)),
                  child: Row(
                    children: [
                      Container(
                        //padding left and right
                        padding: EdgeInsets.only(left: 15, right: 10),
                        child: Image.network(
                          job.images,
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
                              job.position,
                              style: style,
                            ),
                            Container(
                              width: 200,
                              child: Text(
                                  job.location,
                                  //'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
