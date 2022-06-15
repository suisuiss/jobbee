import 'package:flutter/material.dart';
//import blue from login
import 'package:jobbee/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
   final InputDecoration textFormstyle = InputDecoration(
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        
        
  );
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
  final deviceHeight = MediaQuery.of(context).size.height;
  final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: 
        Center(
          child: Container(
            width: deviceWidth*0.8,
            child: Form(
              key:_formKey,
              child: Column(
                 
                children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: 35, top: 35),
                    child: Image.asset('assets/Icon.png',
                    height: 100,width: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      decoration: textFormstyle.copyWith(hintText: 'First Name') 
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      decoration: textFormstyle.copyWith(hintText: 'Last Name') 
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      decoration: textFormstyle.copyWith(hintText: 'Phone Number') 
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      decoration: textFormstyle.copyWith(hintText: 'name') 
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      decoration: textFormstyle.copyWith(hintText: 'name') 
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      decoration: textFormstyle.copyWith(hintText: 'name') 
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      decoration: textFormstyle.copyWith(hintText: 'name') 
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      decoration: textFormstyle.copyWith(hintText: 'name') 
                    ),
                  ),
                  
                 Container(
      //padding buttom only
      margin: EdgeInsets.only(bottom:30),
      height: 50,
      width: deviceWidth * 0.5,
      child: RaisedButton(
        onPressed: () {
          
        },
        color: blue,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          'SIGNUP',
          style: TextStyle(fontSize: 20),
          
        ),
      ),
    )
                  
                ]
              
               
            )),
          ),
        ),
      )
    );
  }
}