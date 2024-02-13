import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/questions.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber({super.key, required this.num, required this.current_question});

  final int num;
  final int current_question;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: num == current_question ? 80 : 60,
      width: num == current_question ? 80 : 60,
      decoration: BoxDecoration(
          color: num == current_question && !questions[num].state_answer.read
              ? Colors.white
              : (!questions[num].state_answer.read
              ? KBluePrograssBtn
              : (questions[num].state_answer.iscorrrect ? KGreen : KRed)),
          shape: BoxShape.circle),
      child: Center(
          child: Text('${num+1}',
              style: TextStyle(
                  fontSize: num == current_question ? 55 : 30,
                  color:
                  num == current_question ? kBlueMainPageUp : Colors.white,
                  fontWeight: FontWeight.bold))),
    );
  }
}
