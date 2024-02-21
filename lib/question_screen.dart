import 'package:flutter/material.dart';
import 'package:test_flutter/answer_button.dart';
import 'package:test_flutter/data/questions.dart';

class Question_Screen extends StatefulWidget {
  // In question Screen we must accept this function
  void Function(String answer) onSelectAnswer;

  Question_Screen({required this.onSelectAnswer, super.key});
  @override
  State<Question_Screen> createState() {
    return _Question_ScreenState();
  }
}

class _Question_ScreenState extends State<Question_Screen> {
  int currentQuestionIndex = 0;
  @override
  Widget build(BuildContext context) {
    void answerQuestion(String selectAnswer) {
      widget.onSelectAnswer(selectAnswer);
      setState(() {
        currentQuestionIndex++;
      });
    }

    final currenQuestion = questions[currentQuestionIndex];
    return Center(
      child: Column(
        children: [
          Text(currenQuestion.text),
          const SizedBox(
            height: 30,
          ),
          // Spreading this list
          ...currenQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                });
          })
        ],
      ),
    );
  }
}
