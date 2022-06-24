import 'package:flutter/material.dart';
import 'package:jobbee/model.dart/user.dart';
import 'package:jobbee/provider/userProvider.dart';
import 'package:provider/provider.dart';

final blue = Color.fromRGBO(57, 172, 231, 100);

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Color(0xffFFFBFB),
        elevation: 0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.images[0],
            onClicked: () async {},
          ),
          const SizedBox(
            height: 24,
          ),
          buildName(context),
          const SizedBox(height: 48),
          buildAbout(context),
        ],
      ),
    );
  }

//Widget for text
  Widget buildName(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Column(
      children: [
        Text(
          user.firstName + ' ' + user.lastName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        Text(
          user.email,
          style: TextStyle(color: Color.fromARGB(255, 86, 86, 86)),
        ),
        Text(
          user.skill,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  Widget buildAbout(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    //device width
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Disabitlity type :' + user.disType,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(height: 16),
          Text(
            'Address',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            user.basedOn + '\n' + user.phoneNo,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
          const SizedBox(height: 8),
          Text(
            'Education',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            user.edLevel + '\n' + user.eddetail,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
          const SizedBox(height: 8),
          Text(
            'Experience',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            user.workEx,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
          Center(
            child: Padding(
              //padding top and bottom
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: button(width, context),
            ),
          )
        ],
      ),
    );
  }
}

Widget button(deviceWidth, context) {
  return Container(
    height: 50,
    width: deviceWidth * 0.5,
    child: RaisedButton(
      onPressed: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      },
      color: blue,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(
        'LOGOUT',
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}

//class for profile pic
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
            width: 128,
            height: 128,
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
