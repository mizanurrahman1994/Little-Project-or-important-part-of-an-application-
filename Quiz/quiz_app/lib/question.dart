import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blueGrey,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28, color: Colors.lightBlueAccent),
        textAlign: TextAlign.center,
      ),
    );
  }
}
