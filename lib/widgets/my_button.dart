import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onTap});

  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: color,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),

          ),
          child: Text(text,textAlign: TextAlign.center,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
