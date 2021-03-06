import 'ContactListPage.dart';
import 'DashboardPage.dart';
import 'OperationPage.dart';
import 'package:flutter/material.dart';

class BottomTabController extends StatefulWidget {
  BottomTabController({Key key}) : super(key: key);

  _BottomTabControllerState createState() => _BottomTabControllerState();
}

class _BottomTabControllerState extends State<BottomTabController> {
  int _index = 2;
  final List<Widget> _navItems = [
    DashboardPage(),
    OperationPage(),
    ContactListPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navItems[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _index,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text('Dashboard')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              title: Text('New Operation')),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text('Contacts'))
        ],
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _index = index;
    });
  }
}
