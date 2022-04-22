import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Dart is an?',
      'answer': [
        {'text': 'A. open-source', 'Score': 0},
        {'text': 'B. general-purpose', 'Score': 0},
        {'text': 'C. programming language', 'Score': 0},
        {'text': 'D. All of the above', 'Score': 1}
      ]
    },
    {
      'questionText': 'Dart has multiple interfaces.',
      'answer': [
        {'text': 'A. TRUE', 'Score': 1},
        {'text': 'B. FALSE', 'Score': 0},
        {'text': 'C. Can be true or false', 'Score': 0},
        {'text': 'D. Can not say', 'Score': 0}
      ]
    },
    {
      'questionText': 'The _______ function is a predefined method in Dart',
      'answer': [
        {'text': 'A. declare()', 'Score': 0},
        {'text': 'B. list()', 'Score': 0},
        {'text': 'C. main()', 'Score': 1},
        {'text': 'D. return()', 'Score': 0}
      ]
    },
    {
      'questionText':
          'Which of the following command specifies where to find imported libraries.',
      'answer': [
        {'text': 'A. -c', 'Score': 0},
        {'text': 'B. -p', 'Score': 1},
        {'text': 'C. -h', 'Score': 0},
        {'text': 'D. All of the above', 'Score': 0}
      ]
    },
    {
      'questionText':
          'An ________ is a real-time representation of any entity.',
      'answer': [
        {'text': 'A. class', 'Score': 0},
        {'text': 'B. method', 'Score': 0},
        {'text': 'C. object', 'Score': 1},
        {'text': 'D. None of the above', 'Score': 0}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have questions!");
    } else {
      print("No more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Center(child: Text("Quiz App")),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
