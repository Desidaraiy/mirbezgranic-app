import 'package:flutter/material.dart';
import 'package:mirbezgranic/utils/app_colors.dart';

class QuizQuestion extends StatefulWidget {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;
  final void Function(int? selectedAnswerIndex) onCheck;
  QuizQuestion({
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
    required this.onCheck,
  });

  @override
  _QuizQuestionState createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  int? selectedAnswerIndex;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question.toUpperCase(),
            style: TextStyle(fontSize: 20),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.answers.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return RadioListTile<int>(
                title: Text(widget.answers[index]),
                value: index,
                groupValue: selectedAnswerIndex,
                activeColor: AppColors.darkBlue2,
                onChanged: (value) {
                  setState(() {
                    selectedAnswerIndex = value;
                  });
                  widget.onCheck(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
