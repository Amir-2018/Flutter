import 'package:flutter/material.dart';

class Start_Screen extends StatelessWidget {
  const Start_Screen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: OutlinedButton(
            onPressed: startQuiz, child: const Text("Click On Me")));
  }
}
