import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: (data['is_user_correct'] as bool)
                        ? Colors.green
                        : Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (data['is_user_correct'] as bool)
                            ? Colors.green
                            : Colors.red),
                    child: Text(
                      (data['question_index']).toString(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          (data['question'] as String),
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        if (!(data['is_user_correct'] as bool))
                          Text(
                            (data['user_answer'] as String),
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        Text(
                          (data['correct_answer'] as String),
                          style: const TextStyle(color: Colors.green),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
