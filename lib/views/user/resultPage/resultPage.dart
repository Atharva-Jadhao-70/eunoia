
import 'package:eunoia/views/user/dashBoard/navigationPage.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage>{

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavigationPage(userId: '',)),
      );
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),

      body: Center(
        child: Container(
          child: const Text('Thank You, Your Result is Fetched on the basis of the questions you answered'),
        )
      ),
    );
  }
}