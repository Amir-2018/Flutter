import 'package:flutter/material.dart';
import 'package:test_flutter/data/questions.dart';

class QuestionSamarry extends StatelessWidget {
  QuestionSamarry(this.sumarryData, {super.key});
  // We gorra transform this list from list of Map objet to list of Widget to could use it
  final List<Map<String, Object>> sumarryData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 300,
        child: Column(
            children: sumarryData.map((peach_of_data) {
          return Row(
            children: [
              Text(((peach_of_data['question_index'] as int) + 1).toString()),
              Expanded(
                child: Column(
                  children: [
                    Text(((peach_of_data['question'] as String))),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(peach_of_data['correct_answer'] as String),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(peach_of_data['user_answer'] as String),
                  ],
                ),
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
