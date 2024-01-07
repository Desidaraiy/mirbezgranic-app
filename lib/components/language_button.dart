import 'package:flutter/material.dart';
import 'package:mirbezgranic/utils/app_colors.dart';

class LanguageButton extends StatelessWidget {
  final String imagePath;
  final String languageCode;
  final bool isSelected;
  final VoidCallback onSelect;


  const LanguageButton({
    Key? key,
    required this.imagePath,
    required this.languageCode,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.darkBlue2: Colors.white,
            width: 3
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
