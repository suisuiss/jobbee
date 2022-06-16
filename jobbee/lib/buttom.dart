import 'package:flutter/material.dart';

class Buttom extends StatefulWidget {
  const Buttom({Key? key}) : super(key: key);

  @override
  State<Buttom> createState() => _ButtomState();
}

class _ButtomState extends State<Buttom> {
  @override
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(context, path[_selectedIndex]);
  }

  final path = ['/home', '/search', '/applied'];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 221, 221, 221),
      selectedItemColor: Color.fromARGB(255, 98, 98, 98),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/homeIcon.png'),
            size: 40,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 43,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/applied.png'),
            size: 43,
          ),
          label: 'applied',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    ));
  }
}
