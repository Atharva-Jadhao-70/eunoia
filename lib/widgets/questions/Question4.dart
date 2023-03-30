
import 'package:eunoia/widgets/questions/Question5.dart';
import 'package:flutter/material.dart';

class Question4 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Question4State();
}

class Question4State extends State<Question4>{
  String? selectedOption;
  List<String> options = ['Never','Sometimes','Most Of the time', 'Every time'];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question - 4')
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Do you have trouble concentrating due to anxiety?',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Question5()));
                }, child: const Text('Next'))
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}