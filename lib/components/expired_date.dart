import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/utils/app_colors.dart';

class ExpiredDate extends StatelessWidget {
  final String title;
  final String? day;
  final void Function() onPressed;
  const ExpiredDate(
      {super.key, required this.title, this.day, required this.onPressed});

  @override
  Widget build(BuildContext context) {
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
              Text(
                title,
                style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.smokyBlack,
                    fontFamily: 'Karla'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ButtonWithIcon(
                    onPressed: onPressed,
                    label:
                        LocaleData.more_button.getString(context).toUpperCase(),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Visibility(
                    visible: day == null,
                    child: Text(
                      '* ${LocaleData.important_information.getString(context)}',
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 9,
                        color: AppColors.smokyBlack,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Visibility(
            visible: day != null,
            child: Text(
              '$day',
              style: const TextStyle(
                color: AppColors.darkBlue2,
                fontSize: 64,
              ),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
