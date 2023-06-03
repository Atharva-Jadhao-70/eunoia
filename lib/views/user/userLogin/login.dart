import 'package:eunoia/views/user/dashBoard/dashBoard.dart';
import 'package:eunoia/views/user/dashBoard/navigationPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../admin/adminLogin/adminLogin.dart';
import '../../admin/dashBoard/adminDashBoard.dart';
import '../signUpPage/signup.dart';

class loginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginPageState();
}

class loginPageState extends State<loginPage> {
  var userName = TextEditingController();
  var passWord = TextEditingController();

  // Login Function
  static Future<User?> loginUsingEmailAndPass(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-fount") {
        print("No user Found");
      }
    }
    return user;
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
                        decoration: InputDecoration(
                          hintText: 'Username or Email',
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
                        controller: passWord,
                        decoration: InputDecoration(
                          hintText: 'Password',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16, left: 16),
                        child: ElevatedButton(
                          onPressed: () async {
                            User? user = await loginUsingEmailAndPass(
                                email: userName.text,
                                pass: passWord.text,
                                context: context);
                            if (user != null) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavigationPage()),
                                  (route) => false);
                            }
                            else{

                            }
                          },
                          child: const Text('Login'),
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
      
            //selectable button for
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  child: Row(
                    children: [
                      SelectableText(
                        'Admin',
                        style: const TextStyle(color: Colors.blue),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminLogin()));
                        },
                      ),
                      const SizedBox(
                        height: 1,
                        width: 10,
                      ),
                      SelectableText(
                        'Doctor',
                        style: const TextStyle(color: Colors.blue),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminLogin()));
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
