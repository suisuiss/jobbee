import 'package:flutter/cupertino.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({ Key? key }) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child:Column(
           children: [
             Text('search bar')
           ],
        )
      )
    );
  }
}