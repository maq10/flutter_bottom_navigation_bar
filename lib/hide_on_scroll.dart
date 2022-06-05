// ---------- import packages ----------
// import the material library
import 'package:flutter/material.dart';
// import the rendering library
import 'package:flutter/rendering.dart';
// ---------- import packages ----------
// ********** Start - Class - HideOnScroll **********
class HideOnScroll extends StatefulWidget {
  const HideOnScroll({Key? key}) : super(key: key);

  @override
  _HideOnScrollState createState() => _HideOnScrollState();
}
// ********** End - Class - HideOnScroll **********

// ********** Start - Class - _HideOnScrollState **********
class _HideOnScrollState extends State<HideOnScroll>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController animationController;
  late List<Widget> _pages;

  // ---------- Method(Function) - _onItemTapped ----------
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // ---------- Method(Function) - _onItemTapped ----------

  // ---------- Method(Function) - initState ----------
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _pages = <Widget>[
      CallsPage(
        isHideBottomNavBar: (isHideBottomNavBar) {
          isHideBottomNavBar
              ? animationController.forward()
              : animationController.reverse();
        },
      ),
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
  }
  // ---------- Method(Function) - initState ----------

  // ---------- Method(Function) - dispose ----------
  @override
  void dispose() {
    // ...
    animationController.dispose();
    super.dispose();
  }
  // ---------- Method(Function) - dispose ----------

  // ---------- Method(Function) - build ----------
  @override
  Widget build(BuildContext context) {
    // ----- Scaffold -----
    return Scaffold(
      appBar: AppBar(
        title: const Text('With TabBar Demo'),
        elevation: 0,
      ),
      body: IndexedStack(
        children: _pages,
        index: _selectedIndex,
      ),
      bottomNavigationBar: SizeTransition(
        sizeFactor: animationController,
        axisAlignment: -1.0,
        child: BottomNavigationBar(
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
      ),
    );
    // ----- Scaffold -----
  }
  // ---------- Method(Function) - build ----------
}
// ********** End - Class - _HideOnScrollState **********

// ********** Start - Class - CallsPage **********
class CallsPage extends StatelessWidget {
  CallsPage({required this.isHideBottomNavBar});
  final Function(bool) isHideBottomNavBar;

  // ---------- Method(Function) - build ----------
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      // ----- Scaffold -----
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
            OutgoingPage(
              isHideBottomNavBar: (value) {
                isHideBottomNavBar(value);
              },
            ),
            Icon(Icons.call_missed_outgoing, size: 350),
          ],
        ),
      ),
      // ----- Scaffold -----
    );
  }
  // ---------- Method(Function) - build ----------
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
              Text('Total incoming calls: $count',
                  style: TextStyle(fontSize: 30)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: clear,
          child: Icon(Icons.clear_all),
        ));
  }
  // ---------- Method(Function) - build ----------

  @override
  bool get wantKeepAlive => true;
}
// ********** End - Class - _IncomingPageState **********

// ********** Start - Class - OutgoingPage **********
class OutgoingPage extends StatefulWidget {
  final Function(bool) isHideBottomNavBar;

  OutgoingPage({required this.isHideBottomNavBar});

  @override
  _OutgoingPageState createState() => _OutgoingPageState();
}
// ********** End - Class - OutgoingPage **********

// ********** Start - Class - _OutgoingPageState **********
class _OutgoingPageState extends State<OutgoingPage>
    with AutomaticKeepAliveClientMixin<OutgoingPage> {
  final items = List<String>.generate(10000, (i) => "Call $i");

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            widget.isHideBottomNavBar(true);
            break;
          case ScrollDirection.reverse:
            widget.isHideBottomNavBar(false);
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }
  // ---------- Method(Function) - build ----------
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      // ----- Scaffold -----
      child: Scaffold(
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${items[index]}'),
              );
            },
          ),
        ),
      ),
      // ----- Scaffold -----
    );
  }
  // ---------- Method(Function) - build ----------

  @override
  bool get wantKeepAlive => true;
}
// ********** End - Class - _OutgoingPageState **********