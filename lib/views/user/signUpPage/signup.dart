import 'package:eunoia/views/user/welcomPage/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class signUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => signUpPageState();
}

class signUpPageState extends State<signUpPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  DateTime? selectedDate;
  var passWord = TextEditingController();

  bool passwordVisiblity = true;

  final formKey = GlobalKey<FormState>();

  void signup() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: passWord.text,
      );

      String userId = userCredential.user!.uid;
      print(userId);

      await firestore.collection('users').doc(userId).set({
        'userName': name.text,
        'userEmail': email.text,
        'userPhoneNumber': phone.text,
        'userDateOfBirth': selectedDate,
        'userTestAttempts': 0,
        'depression_level': null,
        'anxiety_level': null,
        'stress_level': null,
        'firstLogin': true,
        'isActive': true
      });

      DocumentSnapshot snapshot =
          await firestore.collection('users').doc(userId).get();
      print(snapshot);

      // Show success message or navigate to the next screen
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Signup Successful'),
            content: const Text('User created successfully.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  // Navigate to the next screen
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Signup Error'),
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
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
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
      body: Container(
        color: Colors.blue.shade50,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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

                //input name
                Center(
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please input your name';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter full name',
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

                //input email
                Center(
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please input an email';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
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

                //input phone number
                Center(
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      controller: phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please input your phone number';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your ph. no.',
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

                //Date selector
                GestureDetector(
                  onTap: () {
                    selectDate(context);
                  },
                  child: Container(
                    width: 250,
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                        ),
                        controller: TextEditingController(
                          text: selectedDate != null
                              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                              : '',
                        ),
                        validator: (value) {
                          if (selectedDate == null) {
                            return 'Please select a date of birth';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                //input password
                Center(
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      controller: passWord,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please set a password';
                        }
                      },
                      obscureText: passwordVisiblity,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
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
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      signup();
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
