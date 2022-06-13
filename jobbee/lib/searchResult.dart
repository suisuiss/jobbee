import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    //screen height
    //text controller
    final TextEditingController _result = TextEditingController();
    final TextStyle textStyle = TextStyle(
      fontSize: 18,
      //fontweight
      fontWeight: FontWeight.w500,
    );
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final InputDecoration textFormstyle = InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //sreach and filter
            Container(
              height: deviceHeight * 0.13,
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //print clicked
                      print('as');
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: TextFormField(
                    //border
                    controller: _result,
                    decoration: textFormstyle.copyWith(
                      hintText: 'Search',
                    ),
                  )),
                  //filter icon

                  GestureDetector(
                    onTap: () {
                      //print clicked
                       //show dialog
                       
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.tune,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //search result
            SingleChildScrollView(
              child: Container(
                //padding all
                padding: EdgeInsets.all(20),
                child: Column(
                  //cross alignment start

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Result',
                          //font size
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    //sizedd box height 20
                    SizedBox(
                      height: 10,
                    ),
                    
                    //result list
                    //for here
                   Container(
                   decoration: BoxDecoration(
                       color: Colors.grey,
                      
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 70,
                    //padding all
                    padding: EdgeInsets.all(10),
                     child: Row(
                      children: [
                        //image asset 
                        Image.asset(
                          'assets/jobbee.png',
                          height:50 , width: 50),
                        //sized box width 20
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('job position' ,
                           style:textStyle
                          
                            ),
                            Text('job location',style:textStyle.copyWith(fontWeight: FontWeight.w300)  )
                            
                          ],
                        )
                        
                      ],
                     ),
                   )


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
