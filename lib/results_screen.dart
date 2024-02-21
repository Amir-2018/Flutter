import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/data/questions.dart';
import 'package:test_flutter/question_sumarry.dart';

class ResultScreen extends StatelessWidget {
  final List<String> choosenAnswers;
  const ResultScreen({required this.choosenAnswers, super.key});

  // Returning List of formatting data as map
  List<Map<String, Object>> getSumarryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final sumarryData = getSumarryData();
    final NumCorerctQuestions = sumarryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              'You answered $NumCorerctQuestions out of $numTotalQuestions correct'),
          const SizedBox(
            height: 30,
          ),
          QuestionSamarry(getSumarryData()),
          const SizedBox(
            height: 30,
          ),
          TextButton(onPressed: () {}, child: const Text('Restart the Quiz'))
        ]),
      ),
    );
  }
}
