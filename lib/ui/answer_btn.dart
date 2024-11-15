import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key, required this.answerText, required this.onTap});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amberAccent,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
      onPressed: onTap,
      child: Text(
        answerText,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }
}
