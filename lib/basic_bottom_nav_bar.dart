// ---------- import packages ----------
import 'package:flutter/material.dart';
// ---------- import packages ----------
// ********** Start - Class - BasicBottomNavBar **********
class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key}) : super(key: key);

  @override
  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}
// ********** End - Class - BasicBottomNavBar **********

// ********** Start - Class - _BasicBottomNavBarState **********
class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  int _selectedIndex = 0;

  // ---------- List - _pages ----------
  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.call,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
    // Icon(
    //   Icons.chat,
    //   size: 150,
    // ),
  ];
  // ---------- List - _pages ----------

  // ---------- Method(Function) - _onItemTapped ----------
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // ---------- Method(Function) - _onItemTapped ----------

  // ---------- Method(Function) - build ----------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Demo'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'Chats',
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
  // ---------- Method(Function) - build ----------
}
// ********** End - Class - _BasicBottomNavBarState **********