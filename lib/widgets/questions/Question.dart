
import 'package:eunoia/widgets/questions/Question2.dart';
import 'package:flutter/material.dart';

class Question extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => QuestionState();
}

class QuestionState extends State<Question>{
  String? selectedOption;
  List<String> options = ['Never','Sometimes','Most Of the time', 'Every time'];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question - 1')
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Do you feel restless or agitated most of the time?',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                Column(
                  children :options.map(
                  (option) => RadioListTile(
                    title: Text(option,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                    value: option,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                )
                .toList(),
                ),
        
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Question2()));
                }, child: Text('Next'))
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}