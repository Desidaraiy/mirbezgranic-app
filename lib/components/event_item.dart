import 'package:flutter/material.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/utils/app_colors.dart';
import 'package:mirbezgranic/utils/func.dart';
import 'package:url_launcher/url_launcher.dart';
class EventItem extends StatelessWidget {
  final String title;
  final String desc;
  final String buttonText;
  final String link;
  final String imagePath;

  const EventItem({
    super.key,
    required this.title,
    required this.desc,
    required this.buttonText,
    required this.link,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(14)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              color: AppColors.smokyBlack
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            desc,
            style: TextStyle(
                fontSize: 14,
                color: AppColors.smokyBlack
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: 180,
            height: 120,
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          const SizedBox(height: 10,),
          ButtonWithIcon(
              onPressed: () => Utils.launchURL(link),
              label: buttonText.toUpperCase()
          )
        ],
      ),
    );
  }
}
