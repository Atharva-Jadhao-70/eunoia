import 'package:eunoia/views/admin/dashBoard/adminDashBoard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {

  AdminLogin({super.key});

  @override
  State<StatefulWidget> createState() => AdminLoginState();
}

class AdminLoginState extends State<AdminLogin> {
  var userName = TextEditingController();
  var passWord = TextEditingController();

  // Login Function
  static Future<User?> loginUsingEmailAndPass({required String email, required String pass, required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: pass);
      user = userCredential.user;
    } on FirebaseAuthException catch(e){
      if(e.code == "user-not-fount"){
        print("No user Found");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('Eunoia')),

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

                Text('ADMIN LOGIN', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.065, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),

                //Text field for username
                Center(
                  child: Container(
                    width: 250,
                    child: TextField(
                      controller: userName,
                      decoration: InputDecoration(
                        hintText: 'Email',
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

                //text field for password
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

                //Container for login button
                Container(
                  margin: const EdgeInsets.only(right: 16, left: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AdminDashBoard()), (route) => false);
                    },
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
    ));
  }
}
