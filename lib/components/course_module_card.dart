import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/utils/app_colors.dart';

class CourseModuleCard extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final void Function() onStudyPressed;
  final void Function() onTestPressed;
  const CourseModuleCard(
      {super.key,
      required this.title,
      this.isCompleted = false,
      required this.onStudyPressed,
      required this.onTestPressed});

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
                    label: LocaleData.adaptation_course_course_button
                        .getString(context)
                        .toUpperCase(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  !isCompleted
                      ? ButtonWithIcon(
                          onPressed: onTestPressed,
                          label: LocaleData.adaptation_course_test_button
                              .getString(context)
                              .toUpperCase(),
                        )
                      : ButtonWithIcon(
                          onPressed: onTestPressed,
                          isDisabled: true,
                          label: LocaleData.adaptation_course_test_button2
                              .getString(context)
                              .toUpperCase(),
                        )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
