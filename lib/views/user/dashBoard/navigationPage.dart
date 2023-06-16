import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../startTest/startTestScreen.dart';
import 'dashBoard.dart';

class NavigationPage extends StatefulWidget {
  String userId;

  NavigationPage({required this.userId,super.key});

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;
  String? userId;
  
  void openWhatsApp(String phoneNumber) async {
  String url = "whatsapp://send?phone=$phoneNumber";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


  @override
  void initState(){
    userId = widget.userId;
    super.initState();
  }

  final List<Widget> _children = [
    // Add your screens here
    DashboardScreen(),
    StartTestScreen(),
    // Container(),
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
            label: 'Start Test',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'Chat',
          // ),
        ],
      ),
    );
  }
}
