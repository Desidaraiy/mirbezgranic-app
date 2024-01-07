import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';

import '../utils/app_colors.dart';

class BigIconCard extends StatelessWidget {
  final String title;
  final String desc;
  final String buttonText;
  final String iconPath;
  final Function() onPressed;

  const BigIconCard({
    super.key,
    required this.title,
    required this.desc,
    required this.buttonText,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
          color: AppColors.lightGreen, borderRadius: BorderRadius.circular(14)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(color: AppColors.smokyBlack, fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    desc.toLowerCase(),
                    style: TextStyle(color: AppColors.smokyBlack, fontSize: 14),
                  ),
                ),
                ButtonWithIcon(onPressed: onPressed, label: buttonText)
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
              child: SvgPicture.asset(
                  iconPath,
                height: 110,
              ))
        ],
      ),
    );
  }
}
