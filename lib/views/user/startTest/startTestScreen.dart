import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eunoia/views/user/dashBoard/dashBoard.dart';
import 'package:eunoia/views/user/userLogin/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../dashBoard/navigationPage.dart';

class StartTestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartTestScreenState();
}

class StartTestScreenState extends State<StartTestScreen> {
  List<String> questions = [
    "I found it hard to wind down or relax",
    "I was aware of dryness of my mouth",
    "I couldn't seem to experience any positive feeling at all",
    "I experienced breathing difficulty (e.g. excessively rapid breathing, breathlessness in the absence of physical exertion)",
    "I found it difficult to work up the initiative to do things",
    "I tended to over-react to situations",
    "I experienced trembling (e.g. in the hands)",
    "I felt that I was using a lot of nervous energy",
    "I was worried about situations in which I might panic and make a fool of myself",
    "I felt that I had nothing to look forward to and found myself getting agitated",
    "I found it difficult to relax",
    "I felt down-hearted and blue",
    "I was intolerant of anything that kept me from getting on with what I was doing",
    "I felt I was close to panic",
    "I was unable to become enthusiastic about anything",
    "I felt I wasn't worth much as a person",
    "I felt that I was rather touchy",
    "I was aware of the action of my heart in the absence of physical exertion (e.g. sense of heart rate increase, heart missing a beat)",
    "I felt scared without any good reason",
    "I felt that life was meaningless"
  ];

  // List<String> options = [
  //   'Not at all',
  //   'Several Days',
  //   'More than half the days',
  //   'Nearly Every day'
  // ];

  List<int> selectedValue = List.filled(20, 0);
  int currentIndex = 0;

  String depression_level = '';
  String anxiety_level = '';
  String stress_level = '';

  bool isSubmitted = false;

  @override
  void initState() {
    super.initState();
    // getPrediction();
  }

  Future<dynamic> getPrediction(String input_values) async {
    try {
      setState(() {
        isSubmitted = true;
      });
      var data = await http.get(Uri.parse(
          'https://atharva70.pythonanywhere.com/predictAll?input_values=$input_values'));
      // print(jsonDecode(data.body));
      var body = jsonDecode(data.body);
      setState(() {
        depression_level = body['depression_level'];
        anxiety_level = body['anxiety_level'];
        stress_level = body['stress_level'];
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isSubmitted = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    children: [
                      //question
                      Text(
                        questions[index],
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.bold),
                      ),
                      //options
                      Column(children: [
                        RadioListTile(
                          title: const Text('Never'),
                          value: 0,
                          groupValue: selectedValue[index],
                          onChanged: (value) {
                            setState(() {
                              selectedValue[index] = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text('Sometimes'),
                          value: 1,
                          groupValue: selectedValue[index],
                          onChanged: (value) {
                            setState(() {
                              selectedValue[index] = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text('Often'),
                          value: 2,
                          groupValue: selectedValue[index],
                          onChanged: (value) {
                            setState(() {
                              selectedValue[index] = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text('Almost Always'),
                          value: 3,
                          groupValue: selectedValue[index],
                          onChanged: (value) {
                            setState(() {
                              selectedValue[index] = value!;
                            });
                          },
                        ),
                      ]),
                      //submit button
                      Visibility(
                          visible: index == 19,
                          child: ElevatedButton(
                            onPressed: () async {
                              var data =
                                  await getPrediction(selectedValue.join(','))
                                      .then((value) {
                                final DocumentReference docRef =
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(LoginPageState.userId);

                                // Update the specific field
                                docRef.update({
                                  'userDepressionLevel': depression_level,
                                  'userAnxietyLevel': anxiety_level,
                                  'userStressLevel': stress_level
                                });
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Results'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Depression Level',
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.045,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    depression_level,
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.04),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Anxiety Level',
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.045,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    anxiety_level,
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.04),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Stress Level',
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.045,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    stress_level,
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.04),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            NavigationPage(
                                                              userId: '',
                                                            )));
                                              },
                                              child: const Text('Cancel'))
                                        ],
                                      );
                                    });
                              });

                              // String depression_level = data['depression_level'];
                            },
                            child: isSubmitted
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(),
                                  )
                                : const Text('Submit'),
                          )),
                    ],
                  ),
                );
              },
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(questions.length, (int index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? Colors.blue : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
