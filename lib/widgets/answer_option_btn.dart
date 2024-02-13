import 'package:flutter/material.dart';

import '../constant.dart';

class AnswerOptionBtn extends StatelessWidget {
  const AnswerOptionBtn({super.key, required this.answerTxt, required this.option, required this.isOnePress, required this.isTwoPress, required this.onTapped});

  final String answerTxt;
  final int option;
  final bool isOnePress ;
  final bool isTwoPress ;
  final VoidCallback onTapped ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: isOnePress && option == 1
                      ? KAroundBottonYes
                      : (isTwoPress && option == 2
                      ? KAroundBottonYes
                      : const Color(0xFFbcf2f5)),
                  offset: const Offset(-4, -4))
            ],
            color: isOnePress && option == 1
                ? KBottonYes
                : (isTwoPress && option == 2 ? KBottonYes : KBlueBottonNo),
          ),
          child: Text(answerTxt,
              style: const TextStyle(
                  fontSize: 30, fontFamily: 'Roya', color: Colors.white)),
        ));
  }
}
