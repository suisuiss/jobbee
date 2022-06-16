import 'package:flutter/material.dart';
import '../modell/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserInfo.myUser;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a Backbutton')));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

//Widget for text
  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
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

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              'Address',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              user.address + '\n' + user.phone,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 8),
            Text(
              'Education',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              user.education + '\n' + user.educationInfo,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 8),
            Text(
              'Experience',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              user.experience,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
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
        Positioned(bottom: 0, right: 4, child: buildEditIcon(color))
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
