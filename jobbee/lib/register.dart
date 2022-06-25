import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobbee/constant/utils.dart';
//import blue from login
import 'package:jobbee/loginScreen.dart';
import 'package:jobbee/services/userService.dart';
//import dart io
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
static const String routeName = '/signup';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final imagesController = TextEditingController();
  //create firstname controller
  var _currentItem;
  List<File> images = [];
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
  //disType
  final disTypeController = TextEditingController();
  final InputDecoration textFormstyle = InputDecoration(
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
  );
  final _formKey = GlobalKey<FormState>();
  UserService userService = UserService();
  @override
  void dispose() {
    super.dispose();
    // imagesController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    basedOnController.dispose();
    skillController.dispose();
    experienceController.dispose();
    educationLevelController.dispose();
    educationDetailController.dispose();
  }

  void signUpUser() {
    userService.signUpUser(
        context: context,
        images: images,
        firstName: firstnameController.text,
        lastName: lastnameController.text,
        phoneNo: phoneController.text,
        basedOn: basedOnController.text,
        disType: _currentItem.toString(),
        edLevel: educationLevelController.text,
        eddetail: educationDetailController.text,
        workEx: experienceController.text,
        skill: skillController.text,
        email: emailController.text,
        password: passwordController.text);
  }

  void selectImage() async {
    var res = await pickImage();
    setState(() {
      images = res;
    });
  }

  // File? _image;
  // Future pickImage() async {
  //   try {
  //     var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;

  //     final imageTemporary = File(image.path);
  //     setState(() {
  //       _image = imageTemporary;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var distype = [
      'vision Impairment',
      'deaf or hard of hearing',
      'mental health conditions',
      'intellectual disability',
      'acquired brain injury',
      'autism spectrum disorder',
      'physical disability'
    ];
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(children: [
                const SizedBox(height: 20),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        child: IconButton(
                          onPressed: selectImage,
                          iconSize: 150,
                          icon: Image.asset(
                                  'assets/addProfileImg.png',
                                  height: 100,
                                  width: 100,
                                ),
                        ),

                        // child: DottedBorder(
                        //   borderType: BorderType.RRect,
                        //   radius: const Radius.circular(10),
                        //   dashPattern: const [10, 4],
                        //   strokeCap: StrokeCap.round,
                        //   child: Container(
                        //     width: double.infinity,
                        //     height: 150,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         const Icon(
                        //           Icons.folder_open,
                        //           size: 40,
                        //         ),
                        //         const SizedBox(height: 15),
                        //         Text(
                        //           'Select Product Images',
                        //           style: TextStyle(
                        //             fontSize: 15,
                        //             color: Colors.grey.shade400,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ),
                // return Scaffold(
                //     body: SingleChildScrollView(
                //   child: Center(
                //     child: Container(
                //       width: deviceWidth * 0.8,
                //       child: Form(
                //           key: _formKey,
                //           child: Column(children: [
                //             Padding(
                //               padding: EdgeInsets.only(bottom: 35, top: 35),
                //               child: CarouselSlider(
                //                 items: images.map((i) {
                //                   return Builder(
                //                       builder: (BuildContext context) => Image.file(i));
                //                 }).toList(),
                //                 options: CarouselOptions(viewportFraction: 1
                //                 ),
                //               )

                //               // child: IconButton(

                //               //   iconSize: 150,
                //               //   onPressed: () => pickImage(),
                //               //   icon: images != null
                //               //       ? Image.file(images[0])
                //               //       : Image.asset(
                //               //           'assets/Icon.png',
                //               //           height: 100,
                //               //           width: 100,
                //               //         ),
                //               // ),
                //               //imageButton
                //             ),
                //             GestureDetector(onTap:selectImage),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: TextFormField(
                    controller: firstnameController,
                    decoration: textFormstyle.copyWith(hintText: 'First Name'),
                    //null validatoor
                    validator: (value) {
                      if (value == null || value.isEmpty) {
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
                      if (value == null || value.isEmpty) {
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
                      decoration:
                          textFormstyle.copyWith(hintText: 'Phone Number'),
                      validator: (value) {
                        if (value==null || value.isEmpty ) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: TextFormField(
                      controller: basedOnController,
                      decoration: textFormstyle.copyWith(
                          hintText: 'Based on(city,country)'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your location';
                        }
                        return null;
                      }),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                   child:  DropdownButtonFormField(
                    items: distype.map((item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (value) => setState(() {
                      _currentItem = value;
                      
                    }),
                    decoration: textFormstyle.copyWith(hintText: 'disability type'),
                )),
                   
                   
                      
                  //dropdown  

                  
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: TextFormField(
                      controller: educationLevelController,
                      decoration:
                          textFormstyle.copyWith(hintText: 'Education level'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your education level';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: TextFormField(
                      controller: educationDetailController,
                      decoration:
                          textFormstyle.copyWith(hintText: 'Education field'),
                      validator: (value ) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your education field';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: TextFormField(
                      controller: experienceController,
                      decoration:
                          textFormstyle.copyWith(hintText: 'Work experience'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your work experience';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: TextFormField(
                      controller: skillController,
                      decoration: textFormstyle.copyWith(hintText: 'Skill'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your skill';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: TextFormField(
                      controller: emailController,
                      decoration: textFormstyle.copyWith(hintText: 'Email'),
                      validator: (value ) {
                        var emailRegex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';

                          return null;
                          //email regex

                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: textFormstyle.copyWith(hintText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: TextFormField(
                      controller: confirmpasswordController,
                      obscureText: true,
                      decoration:
                          textFormstyle.copyWith(hintText: 'Confirm Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please comfirm your password';
                        } else if (confirmpasswordController.text !=
                            passwordController.text) {
                          return 'Password does not match';
                        }
                        return null;
                      }),
                ),
                Container(
                  //padding buttom only
                  margin: EdgeInsets.only(bottom: 30),
                  height: 50,
                  width: deviceWidth * 0.5,
                  child: RaisedButton(
                    onPressed: () {
                      if(images.isEmpty){
                        ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              //duration 2
                                              //green snackbar

                                              SnackBar(
                                        shape: RoundedRectangleBorder(
                                          
                                        ),
                                        //floating behaviour
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.green,
                                        duration: Duration(seconds: 2),
                                        content: Text(
                                          'please insert your image',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,

                                            //textalign center
                                          ),
                                        ),
                                      ));
                        
                      }else if (_formKey.currentState!.validate()) {
                        signUpUser();
                      }
                    },
                    color: blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'SIGNUP',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ])),
        ),
      ),
    );
    Widget toLogin(){
      return      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already a user?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero, // Set this
                            padding: EdgeInsets.zero, // and this
                          ),
                          child: Text(
                            '  Log in',
                            style: TextStyle(color: blue),
                          ),
                        )
                      ],
                    );
    }
  }
}
