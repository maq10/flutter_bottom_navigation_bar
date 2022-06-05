// ---------- import packages ----------
// import the material library
import 'package:flutter/material.dart';
// ---------- import packages ----------
// ********** Start - Class - WithFabButton **********
class WithFabButton extends StatefulWidget {
  const WithFabButton({Key? key}) : super(key: key);

  @override
  _WithFabButtonState createState() => _WithFabButtonState();
}
// ********** End - Class - WithFabButton **********
// ********** Start - Class - _WithFabButtonState **********
class _WithFabButtonState extends State<WithFabButton> {
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
    // ----- Scaffold -----
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Demo'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
    // ----- Scaffold -----
  }
  // ---------- Method(Function) - build ----------
}
// ********** End - Class - _WithFabButtonState **********