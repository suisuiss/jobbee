import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobbee/provider/userProvider.dart';
//import dart io
import 'dart:io';

import 'package:provider/provider.dart';

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
    final user = Provider.of<UserProvider>(context).user;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
        height: deviceHeight * 0.11,
        //color: Color.fromARGB(255, 219, 219, 219),
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                        child: ProfileWidget(
                          imagePath: user.images[0],
                          onClicked: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                        ),
                      ),
                    ]),
              ],
            )));
  }
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
        child: Stack(
      children: [
        buildImage(),
        // Positioned(bottom: 0, right: 4,)) //child: buildEditIcon(color))
      ],
    ));
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return buildCircle(
      color: Colors.white,
      all: 3,
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image,
            fit: BoxFit.cover,
            width: 60,
            height: 60,
            child: InkWell(onTap: onClicked),
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 5,
          child: Icon(
            Icons.edit,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
