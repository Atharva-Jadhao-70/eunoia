import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eunoia/views/user/dashBoard/dashBoard.dart';
import 'package:eunoia/views/user/dashBoard/navigationPage.dart';
import 'package:eunoia/views/user/startTest/startTestScreen.dart';
import 'package:eunoia/views/user/welcomPage/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../admin/adminLogin/adminLogin.dart';
import '../../admin/dashBoard/adminDashBoard.dart';
import '../signUpPage/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var userName = TextEditingController();
  var passWord = TextEditingController();

  static String? userId;

  bool isLoggingIn = false;

  bool passwordVisiblity = true;

  // Login Function
  Future<void> loginUsingEmailAndPass(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    setState(() {
      isLoggingIn = true;
    });
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      userId = userCredential.user?.uid;

      final DocumentSnapshot userSnapshot =
          await firestore.collection('users').doc(userId).get();

      final userData = userSnapshot.data() as Map<String, dynamic>;
      if (userData['firstLogin']) {
        final DocumentReference docRef = FirebaseFirestore.instance
            .collection('users')
            .doc(userId);

          // Update the specific field
        docRef.update({
          'firstLogin': false,
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => WelcomePage()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => NavigationPage(
                      userId: userId!,
                    )),
            (route) => false);
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        isLoggingIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Eunoia',
        )),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
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
                    'LOGIN',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: 250,
                      child: TextField(
                        controller: userName,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
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
                        controller: passWord,
                        obscureText: passwordVisiblity,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color:
                                  passwordVisiblity ? Colors.grey : Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisiblity = !passwordVisiblity;
                              });
                            },
                          ),
                          hintText: 'Password',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16, left: 16),
                        child: ElevatedButton(
                          onPressed: () async {
                            isLoggingIn
                                ? null
                                : await loginUsingEmailAndPass(
                                    email: userName.text,
                                    pass: passWord.text,
                                    context: context);
                          },
                          child: isLoggingIn
                              ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(color: Colors.white,),
                              ) // Show progress indicator
                              : Text('Login'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 16, left: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signUpPage()));
                          },
                          child: const Text('SignUp'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Forget Password'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
