import 'package:flutter/material.dart';
import 'package:quiz_app_1/widgets/question_number.dart';

import '../models/questions.dart';

class QuestionNumberList extends StatelessWidget {
   QuestionNumberList(
      {super.key, required this.current_question, required this.scrollController});

  final int current_question;
  final  ScrollController scrollController;

  List<Widget> list = [];

  @override
  Widget build(BuildContext context) {

    for (int i = 0; i < questions.length; i++) {
      list.add(QuestionNumber(current_question: current_question,num: i,));
    }
    return   SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }
}
