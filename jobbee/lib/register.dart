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
  //create firstname controller
  final firstnameController = TextEditingController();
  //create lastname controller
  final lastnameController = TextEditingController();
  //create email controller
  final emailController = TextEditingController();
  //create password controller
  final passwordController = TextEditingController();
  //create confirm password controller
  final confirmpasswordController = TextEditingController();
  //create phone number controller
  final phoneController = TextEditingController();
  //create address controller
  final basedOnController = TextEditingController();
  //create skill controller
  final skillController = TextEditingController();
  //create experience controller
  final experienceController = TextEditingController();
  //create education controller
  final educationLevelController = TextEditingController();
  //create educationDetail controller
  final educationDetailController = TextEditingController();
  
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
                      controller: firstnameController,
                      decoration: textFormstyle.copyWith(hintText: 'First Name') ,
                      //null validatoor
                      validator: (value) {
                        if (value==null) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      controller: lastnameController,
                      decoration: textFormstyle.copyWith(hintText: 'Last Name'),
                        validator: (value) {
                        if (value==null) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      controller: phoneController,
                      decoration: textFormstyle.copyWith(hintText: 'Phone Number'),
                        validator: (value) {
                        if (value==null) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      }
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      controller: basedOnController,
                      decoration: textFormstyle.copyWith(hintText: 'Based on(city,country)'),
                        validator: (value) {
                        if (value==null) {
                          return 'Please enter your location';
                        }
                        return null;
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      controller: educationLevelController,
                      decoration: textFormstyle.copyWith(hintText: 'Education level'),
                        validator: (value) {
                        if (value==null) {
                          return 'Please enter your education level';
                        }
                        return null;
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      controller: educationDetailController,
                      decoration: textFormstyle.copyWith(hintText: 'Education field'),
                        validator: (value) {
                        if (value==null) {
                          return 'Please enter your education field';
                        }
                        return null;
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      controller:  experienceController,
                      decoration: textFormstyle.copyWith(hintText: 'Work experience'),
                        validator: (value) {
                        if (value==null) {
                          return 'Please enter your work experience';
                        }
                        return null;
                      }
                    ),
                  ),
                  Padding(

                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      controller: skillController,
                      decoration: textFormstyle.copyWith(hintText: 'Skill') ,
                        validator: (value) {
                        if (value==null) {
                          return 'Please enter your skill';
                        }
                        return null;
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      controller: emailController,
                      decoration: textFormstyle.copyWith(hintText: 'Email'),
                        validator: (value) {
                          var emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (value==null) {
                          return 'Please enter your email';
                        }  if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';

                        return null;
                        //email regex
                      
                      }}
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: textFormstyle.copyWith(hintText: 'Password'),
                        validator: (value) {
                        if (value==null) {
                          return 'Please enter your password';
                        }
                        return null;
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: TextFormField(
                      controller: confirmpasswordController,
                      decoration: textFormstyle.copyWith(hintText: 'Confirm Password'),
                        validator: (value) {
                        if (value==null) {
                          return 'Please comfirm your password';
                        }else if(confirmpasswordController.text!=passwordController.text){
                          return 'Password does not match';
                        }
                        return null;
                      }
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