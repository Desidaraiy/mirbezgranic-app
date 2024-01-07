import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ButtonWithIcon extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final bool isDisabled;
  const ButtonWithIcon(
      {super.key,
      required this.onPressed,
      required this.label,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled
              ? Colors.grey
              : AppColors.darkBlue2, // Background color of the button
          foregroundColor: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          minimumSize: Size.zero,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isDisabled ? Colors.black54 : Colors.white,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: isDisabled ? Colors.black54 : Colors.white,
            size: 15,
          )
        ],
      ),
    );
  }
}
