import 'package:flutter/material.dart';

class AdminDashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AdminDashBoardState();
}

class AdminDashBoardState extends State<AdminDashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panels'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Button for Show all user
            ElevatedButton(
              onPressed: () {}, 
              child: const Text('Show All Users')
            ),
            
            //Button for Show all doctors
            ElevatedButton(
              onPressed: () {}, 
              child: const Text('Show all doctors')
            ),
      
            //Button for authorize doctor
            ElevatedButton(
              onPressed: () {}, 
              child: const Text('Authorize Doctors')
            ),

            //Button for Other
            ElevatedButton(
              onPressed: () {}, 
              child: const Text('Other Options')
            ),
      
          ],
        ),
      ),
    ));
  }
}
