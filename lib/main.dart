import 'package:eunoia/views/user/userLogin/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Initialize firebase app
  Future<FirebaseApp> initializeFireBase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: initializeFireBase(),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return loginPage();
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
