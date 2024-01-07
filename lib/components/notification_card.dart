import 'package:flutter/material.dart';
import 'package:mirbezgranic/utils/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: AppColors.lightGreen),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: c_width,
                child: Text(
                  title.toUpperCase(),
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.smokyBlack,
                      fontFamily: 'Karla'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: c_width,
                child: Text(
                  message,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.smokyBlack,
                      fontFamily: 'Karla'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
