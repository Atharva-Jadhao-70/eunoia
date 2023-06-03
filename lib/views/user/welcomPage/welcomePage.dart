import 'package:eunoia/views/user/startTest/startTestScreen.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StartTestScreen()));
            });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Welcome to Eunoia'),
            ),
            body: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Welcome,',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Please go through the test first, as per your knowledge',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.055),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )));
  }
}
