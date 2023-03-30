import 'package:flutter/material.dart';

class QuestionWithOptions extends StatefulWidget {
  final String question;
  final List<String> options;
  final Function(String)? onOptionSelected;

  QuestionWithOptions({
    required this.question,
    required this.options,
    this.onOptionSelected,
  });

  @override
  _QuestionWithOptionsState createState() => _QuestionWithOptionsState();
}

class _QuestionWithOptionsState extends State<QuestionWithOptions> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.options
              .map(
                (option) => RadioListTile(
                  title: Text(option),
                  value: option,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value.toString();
                      widget.onOptionSelected!(value.toString());
                    });
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
