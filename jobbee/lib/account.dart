import 'package:flutter/material.dart';

var blue = Color.fromRGBO(57, 172,231, 100);

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
    
 
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex:6,
                child: Container(
                  
                width: 160,
                height: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image(image: AssetImage('assets/locowithname.png'),
                       
                      ),
                    ),
                  ],
                ),
                  
              )),
              Expanded(
                flex:5,
                child: Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                        Container(
                          height: 50,
                          width: deviceWidth*0.55,
                          child: RaisedButton(
                          
                          onPressed: (() => 
                          //push name login
                          Navigator.pushNamed(context, '/login')),
                          
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: blue , width: 2.0),
                          
                          ),
                          textColor: Colors.black,
                          child: Text('LOGIN',style: TextStyle(fontSize: 20),),
                      ),
                        ),
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: deviceWidth * 0.55,
                        child: RaisedButton(
                          color: blue,
                          onPressed: (() =>
                          
                          Navigator.pushNamed(context, '/signup')),
                           shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30.0),
                          ),
                           
                          textColor: Colors.white,
                          child: Text('SIGNUP' , style: TextStyle(fontSize: 20),),
                        ),
                      )
                  ]
                )
                , 
                
               
              )),
            ],
          ),
        ),
      ),
    );
  }
}
