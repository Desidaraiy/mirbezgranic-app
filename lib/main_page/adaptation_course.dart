import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mirbezgranic/components/course_module_card.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/main_page/adaptation_course_studying.dart';
import 'package:mirbezgranic/main_page/adaptation_test.dart';
import 'package:mirbezgranic/main_page/notifications_page.dart';
import 'package:mirbezgranic/models/user.dart';
import 'package:mirbezgranic/repository/serverRepository.dart';
import 'package:mirbezgranic/repository/userRepository.dart';
import 'package:mirbezgranic/utils/app_colors.dart';
import 'package:mirbezgranic/utils/app_icons.dart';

import '../utils/func.dart';

class AdaptationCourseView extends StatefulWidget {
  const AdaptationCourseView({super.key});

  @override
  State<AdaptationCourseView> createState() => _AdaptationCourseViewState();
}

class _AdaptationCourseViewState extends State<AdaptationCourseView> {
  late UserModel user;
  bool isTakenCourse = false;
  @override
  void initState() {
    super.initState();
    initUser();
  }

  Future<void> initUser() async {
    user = await LocalUserRepository.getUser();
    isTakenCourse = user.hasTakenCourse == 1;
    setState(() {});
  }

  Future<void> _runTest() async {
    final bool? passed = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AdaptationCourseTestView(),
        ));
    if (passed == null) return;
    String title = passed
        ? LocaleData.test_passed_title.getString(context)
        : LocaleData.test_not_passed_title.getString(context);
    String desc = passed
        ? LocaleData.test_passed_desc.getString(context)
        : LocaleData.test_not_passed_desc.getString(context);
    showMessageDialog(context, title, desc);
    if (passed) {
      final UserModel _user = await LocalUserRepository.getUser();
      _user.hasTakenCourse = 1;
      await LocalUserRepository.saveUser(_user);
      bool serverResult = await ServerRepository.takeACourse(_user);
      print('server result is $serverResult');
    }
  }

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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationsView(),
                          ));
                    },
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
                  LocaleData.adaptation_course.getString(context),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppColors.smokyBlack),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CourseModuleCard(
                title: LocaleData.adaptation_course_1module_title
                    .getString(context),
                onStudyPressed: () {},
                onTestPressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              CourseModuleCard(
                title: LocaleData.adaptation_course_2module_title
                    .getString(context),
                onStudyPressed: () {},
                onTestPressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              CourseModuleCard(
                title: LocaleData.adaptation_course_3module_title
                    .getString(context),
                onStudyPressed: () {},
                onTestPressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              CourseModuleCard(
                title: LocaleData.adaptation_course_4module_title
                    .getString(context),
                onStudyPressed: () {},
                onTestPressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              CourseModuleCard(
                isCompleted: isTakenCourse,
                title: LocaleData.adaptation_course_5module_title
                    .getString(context),
                onStudyPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdaptationCourseStudyView(),
                      ));
                },
                onTestPressed: () {
                  _runTest();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
