// ---------- import packages ----------
// import the material library
import 'package:flutter/material.dart';
// import the rendering library
import 'package:flutter/rendering.dart';
// ---------- import packages ----------
// ********** Start - Class - WithTabBar **********
class WithTabBar extends StatefulWidget {
  const WithTabBar({Key? key}) : super(key: key);

  @override
  _WithTabBarState createState() => _WithTabBarState();
}
// ********** End - Class - WithTabBar **********

// ********** Start - Class - _WithTabBarState **********
class _WithTabBarState extends State<WithTabBar> {
  int _selectedIndex = 0;

  // ---------- List - _pages ----------
  static const List<Widget> _pages = <Widget>[
    CallsPage(),
    Center(
      child: Icon(
        Icons.camera,
        size: 150,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: 'Find contact',
            labelStyle: TextStyle(fontWeight: FontWeight.bold)),
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
        title: const Text('With TabBar Demo'),
        elevation: 0,
      ),
      body: IndexedStack(
        children: _pages,
        index: _selectedIndex,
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
// ********** End - Class - _WithTabBarState **********

// ********** Start - Class - CallsPage **********
class CallsPage extends StatelessWidget {
  const CallsPage();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Incoming',
                  ),
                  Tab(
                    text: 'Outgoing',
                  ),
                  Tab(
                    text: 'Missed',
                  ),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            IncomingPage(),
            OutgoingPage(),
            MissedPage(),
          ],
        ),
      ),
    );
  }
}
// ********** End - Class - CallsPage **********
// ********** Start - Class - IncomingPage **********
class IncomingPage extends StatefulWidget {
  @override
  _IncomingPageState createState() => _IncomingPageState();
}
// ********** End - Class - IncomingPage **********
// ********** Start - Class - _IncomingPageState **********
class _IncomingPageState extends State<IncomingPage>
    with AutomaticKeepAliveClientMixin<IncomingPage> {
  int count = 10;

  // ---------- Method(Function) - clear ----------
  void clear() {
    setState(() {
      count = 0;
    });
  }
  // ---------- Method(Function) - clear ----------
  // ---------- Method(Function) - build ----------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.call_received, size: 350),
            // Text('Total incoming calls: $count',
            //     style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: clear,
      //   child: Icon(Icons.clear_all),
      // ),
    );
  }
  // ---------- Method(Function) - build ----------

  @override
  bool get wantKeepAlive => true;
}
// ********** End - Class - _IncomingPageState **********
// ********** End - Class - OutgoingPage **********
class OutgoingPage extends StatefulWidget {
  @override
  _OutgoingPageState createState() => _OutgoingPageState();
}
// ********** End - Class - OutgoingPage **********
// ********** Start - Class - _OutgoingPageState **********
class _OutgoingPageState extends State<OutgoingPage>
    with AutomaticKeepAliveClientMixin<OutgoingPage> {
  final items = List<String>.generate(10000, (i) => "Call $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: Icon(Icons.call_made_outlined, size: 350),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
// ********** End - Class - _OutgoingPageState **********
// ********** Start - Class - MissedPage **********
class MissedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.call_missed_outgoing, size: 350);
  }
}
// ********** End - Class - MissedPage **********