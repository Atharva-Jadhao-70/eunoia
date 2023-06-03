import 'package:flutter/material.dart';

import '../startTest/startTestScreen.dart';
import 'dashBoard.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    // Add your screens here
    DashboardScreen(),
    StartTestScreen(),
    Container(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz_outlined),
            label: 'Take the quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
