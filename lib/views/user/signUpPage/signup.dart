import 'package:eunoia/views/user/welcomPage/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => signUpPageState();
}

class signUpPageState extends State<signUpPage> {
  var Name = TextEditingController();
  var email = TextEditingController();
  var userName = TextEditingController();
  var passWord = TextEditingController();
  var confPassWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Eunoia',
        )),
      ),
      body: Container(
        color: Colors.blue.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/logo.png'),
            ),
            const Text(
              'SIGN UP',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 250,
                child: TextField(
                  controller: Name,
                  decoration: InputDecoration(
                    hintText: 'Enter full name',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 250,
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 250,
                child: TextField(
                  controller: userName,
                  decoration: InputDecoration(
                    hintText: 'Select username',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 250,
                child: TextField(
                  controller: passWord,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 250,
                child: TextField(
                  controller: confPassWord,
                  decoration: InputDecoration(
                    hintText: 'Confirm your password',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email.text, password: passWord.text)
                    .then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                }).onError((error, stackTrace){
                  print('Error ${error.toString()}');
                });
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
