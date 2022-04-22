import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final resetHandler;

  //positional argument
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore == 5) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore == 4) {
      resultText = 'Pretty likeable!';
    } else if (resultScore == 3) {
      resultText =
          'You have to improve your skill and your total number is $resultScore .';
    } else {
      resultText = 'You are so bad and your total number is less than two .';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      //here is resultText is a method not a function
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "You exam result is here",
            style: TextStyle(fontSize: 28, color: Colors.green),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              resultPhrase,
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: resetHandler,
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey, shadowColor: Colors.black),
              child: Text(
                'Restart Quiz',
                style: TextStyle(fontSize: 24, color: Colors.yellow),
              ))
        ],
      ),
    );
  }
}
