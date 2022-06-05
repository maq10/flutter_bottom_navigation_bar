// ---------------------------------------------
// Name: Miguel Quezada
// Date: 5/27/22
// App: flutter_bottom_navigation_bar
// Class: MyApp - Implement BottomNavigationBar widget
// ---------------------------------------------
// ---------- import packages ----------
// import the material library
import 'package:flutter/material.dart';
// import bottom navigation bar class
import 'basic_bottom_nav_bar.dart';
// ---------- import packages ----------

// ---------- Method(Function) - main ----------
void main() {
  runApp(MyApp());
}
// ---------- Method(Function) - main ----------
// ********** Start - Class - MyApp **********
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
// ********** End - Class - MyApp **********
// ********** Start - Class - _MyAppState **********
class _MyAppState extends State<MyApp> {

  // ---------- Method(Function) - build ----------
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: BasicBottomNavBar(),
    );
  }
  // ---------- Method(Function) - build ----------

}
// ********** End - Class - _MyAppState **********

// BottomNavigationBar class
// https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
// A material widget that's displayed at the bottom of an app for selecting
// among a small number of views, typically between three and five.