import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttom extends StatefulWidget {
  const Buttom({ Key? key }) : super(key: key);

  @override
  State<Buttom> createState() => _ButtomState();
}

class _ButtomState extends State<Buttom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
    backgroundColor: Color.fromARGB(255, 221, 221, 221),
    selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:  Icon(
             Icons.adb,
              size: 45,
               
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              size: 43,
               
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              size: 43,
               
            ),
            label: 'applied',
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.grey[700],
        // onTap: _onItemTapped,
      )
      
    );
  }
}