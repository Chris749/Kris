import 'package:flutter/material.dart';

import './question.dart';
import './answers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static const questions = [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': ['black', 'white', 'blue', 'purple'],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': ['panda', 'lion', 'cat', 'dog'],
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': ['Max', 'Max', 'Max', 'Max'],
    },
  ];

  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[questionIndex]['questionText'].toString(),
                  ),
                  ...(questions[questionIndex]['answer'] as List<String>)
                      .map((answer) {
                    return Answers(answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it!'),
              ),
      ),
    );
  }
}
