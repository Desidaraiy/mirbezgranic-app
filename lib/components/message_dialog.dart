import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageDialog extends StatelessWidget {
  final String title;
  final String desc;
  final bool isSuccess;
  final Function() closeClicked;

  const MessageDialog(
      {super.key,
      required this.closeClicked,
      required this.title,
      required this.desc,
      this.isSuccess = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: closeClicked,
              child: const Icon(
                Icons.close,
                opticalSize: 5,
                color: AppColors.darkBlue2,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                  color: AppColors.smokyBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            desc.toUpperCase(),
            softWrap: true,
            style: const TextStyle(fontSize: 14, color: AppColors.smokyBlack),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          isSuccess
              ? Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/success.svg'),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
