import 'package:flutter/material.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/utils/app_colors.dart';

class CourseStudyModuleCard extends StatelessWidget {
  final String title;
  final String buttonLabel;
  final void Function() onStudyPressed;

  const CourseStudyModuleCard({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.onStudyPressed,
  });

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: AppColors.lightGreen),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: c_width,
                child: Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.smokyBlack,
                      fontFamily: 'Karla'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ButtonWithIcon(
                    onPressed: onStudyPressed,
                    label: buttonLabel.toUpperCase(),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
