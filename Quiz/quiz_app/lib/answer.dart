import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: selectHandler,
            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
            child: Text(
              answerText,
              style: TextStyle(
                fontSize: 28,
              ),
            )),
      ),
      SizedBox(
        height: 10,
      )
    ]);
  }
}
