import 'package:flutter/material.dart';

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

  List<String> options = [
    'Not at all',
    'Several Days',
    'More than half the days',
    'Nearly Every day'
  ];

  List<int> selectedValue = List.filled(20, 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
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
                          title: Text('Not at all'),
                          value: 0,
                          groupValue: selectedValue[index],
                          onChanged: (value) {
                            setState(() {
                              selectedValue[index] = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Several Days'),
                          value: 1,
                          groupValue: selectedValue[index],
                          onChanged: (value) {
                            setState(() {
                              selectedValue[index] = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('More than half days'),
                          value: 2,
                          groupValue: selectedValue[index],
                          onChanged: (value) {
                            setState(() {
                              selectedValue[index] = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Nearly Every Day'),
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
                        visible: index==19,
                        child: ElevatedButton(
                          onPressed: (){
                            print(selectedValue);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavigationPage()), (route) => false);
                          },
                          child: const Text('Submit'),
                        )
                      ),
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
                margin: EdgeInsets.symmetric(horizontal: 4.0),
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
