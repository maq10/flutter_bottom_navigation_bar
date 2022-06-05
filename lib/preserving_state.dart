// ---------- import packages ----------
// import the material library
import 'package:flutter/material.dart';
// ---------- import packages ----------

// ********** Start - Class - PreservingBottomNavState **********
class PreservingBottomNavState extends StatefulWidget {
  const PreservingBottomNavState({Key? key}) : super(key: key);

  @override
  _PreservingBottomNavStateState createState() =>
      _PreservingBottomNavStateState();
}
// ********** End - Class - PreservingBottomNavState **********

// ********** Start - Class - _PreservingBottomNavStateState **********
class _PreservingBottomNavStateState extends State<PreservingBottomNavState> {
  int _selectedIndex = 0;

  // ---------- List - _pages ----------
  static const List<Widget> _pages = <Widget>[
    Center(
      child: Icon(
        Icons.call,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.camera,
        size: 150,
      ),
    ),
    Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          style: TextStyle(fontSize: 50),
          decoration: InputDecoration(
              labelText: 'Find contact',
              labelStyle: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    ),
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
        title: const Text('Preserving State Demo'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
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
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
  // ---------- Method(Function) - build ----------
}
// ********** End - Class - _PreservingBottomNavStateState **********