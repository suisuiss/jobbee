import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import dart io
import 'dart:io';

File image = new File('assets/jobbee.png');
var decodedImage = decodeImageFromList(image.readAsBytesSync());

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  //query for the height of the screen

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.11,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              //canPop
              onTap: () {
                //  if(Navigator.canPop(context)){
                //     Navigator.pop(context);
                //  }else{
                // //  return null;

                //  }

                print('pressed');
              },
              child: Container(
                child: Image.asset(
                  'assets/jobbee.png',
                  //add border color
                  //get the wif=dth and height of the image

                  width: 120, height: 60,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Icon(Icons.account_circle, size: 60),
            )
          ]),
        ]),
      ),
    );
  }
}
