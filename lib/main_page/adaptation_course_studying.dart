import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mirbezgranic/components/course_study_card.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/main_page/adaptation_course_video.dart';
import 'package:mirbezgranic/main_page/adaptation_test.dart';
import 'package:mirbezgranic/models/user.dart';
import 'package:mirbezgranic/repository/serverRepository.dart';
import 'package:mirbezgranic/repository/userRepository.dart';
import 'package:mirbezgranic/utils/app_colors.dart';
import 'package:mirbezgranic/utils/app_icons.dart';

import '../utils/func.dart';

class AdaptationCourseStudyView extends StatefulWidget {
  const AdaptationCourseStudyView({super.key});

  @override
  State<AdaptationCourseStudyView> createState() =>
      _AdaptationCourseStudyViewState();
}

class _AdaptationCourseStudyViewState extends State<AdaptationCourseStudyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 14, right: 24, top: 50, bottom: 130),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: 30.0,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2),
                      child: SvgPicture.asset(
                        AppIcons.notification,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  LocaleData.adaptation_course_5module_title.getString(context),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppColors.smokyBlack),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CourseStudyModuleCard(
                title: LocaleData.adaptation_course_5module_lesson51_title
                    .getString(context),
                buttonLabel: LocaleData.adaptation_course_video_button
                    .getString(context),
                onStudyPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdaptationCourseVideoView(),
                      ));
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
