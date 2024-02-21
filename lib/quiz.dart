import 'package:flutter/material.dart';
import 'package:test_flutter/data/questions.dart';
import 'package:test_flutter/question_screen.dart';
import 'package:test_flutter/results_screen.dart';
import 'package:test_flutter/start_screen.dart';

// The widget class
class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// The State class
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void choosedAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;
    screenWidget = activeScreen == "question-screen"
        ? Question_Screen(onSelectAnswer: choosedAnswer)
        : Start_Screen(switchScreen);
    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(body: screenWidget),
    );
  }
}
