import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/components/message_dialog.dart';
import 'package:mirbezgranic/components/quiz_question.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/main_page/notifications_page.dart';
import 'package:mirbezgranic/utils/app_colors.dart';
import 'package:mirbezgranic/utils/app_icons.dart';
import 'package:mirbezgranic/utils/func.dart';

class AdaptationCourseTestView extends StatefulWidget {
  const AdaptationCourseTestView({super.key});

  @override
  State<AdaptationCourseTestView> createState() =>
      _AdaptationCourseTestViewState();
}

class _AdaptationCourseTestViewState extends State<AdaptationCourseTestView> {
  final Map<int, int> _correctAnswersMap = {
    0: 1,
    1: 1,
    2: 0,
    3: 3,
    4: 1,
  };
  final Map<int, int> _selectedAnswersMap = {
    0: 0,
    1: 0,
    2: 0,
    3: 0,
    4: 0,
  };

  @override
  void initState() {
    super.initState();
  }

  void _collectAnswers() {
    int errorCount = 0;

    for (int i = 0; i < _correctAnswersMap.length; i++) {
      if (_correctAnswersMap[i] != _selectedAnswersMap[i]) {
        errorCount++;

        if (errorCount > 1) {
          break;
        }
      }
    }

    bool passed = errorCount <= 1;
    Navigator.pop(context, passed);
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
              QuizQuestion(
                  question: "1. В какой срок нужно пройти дактилоскопию?",
                  answers: ['1 месяц', '90 суток', '3 месяца'],
                  correctAnswerIndex: 1,
                  onCheck: (index) {
                    if (index != null) {
                      _selectedAnswersMap[0] = index;
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              QuizQuestion(
                  question:
                      "2. С какого момента начинается отсчёт дней для постановки на миграционный учёт?",
                  answers: [
                    'С даты открытия однократной визы',
                    'С даты въезда (пересечения границы)',
                    'Со следующего дня после пересечения границы'
                  ],
                  correctAnswerIndex: 1,
                  onCheck: (index) {
                    if (index != null) {
                      _selectedAnswersMap[1] = index;
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              QuizQuestion(
                  question:
                      "3. Сколько дней студент может находиться в другом городе России без регистрации?",
                  answers: [
                    '3 дня',
                    '90 суток',
                    'Ни одного дня, нужно сразу вставать на регистрацию'
                  ],
                  correctAnswerIndex: 0,
                  onCheck: (index) {
                    if (index != null) {
                      _selectedAnswersMap[2] = index;
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              QuizQuestion(
                  question:
                      "4. В каком случае студенту необходимо немедленно обратиться в Отдел миграционного учёта, виз и регистраций?",
                  answers: [
                    'Если студент планирует уезжать на каникулы домой',
                    'Если студент потерял документы',
                    'Если студент лежал в больнице',
                    'Все варианты верны'
                  ],
                  correctAnswerIndex: 3,
                  onCheck: (index) {
                    if (index != null) {
                      _selectedAnswersMap[3] = index;
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              QuizQuestion(
                  question:
                      "5. В какой срок нужно прийти в Отдел миграционного учёта, виз и регистраций для продления регистрации?",
                  answers: [
                    'В течение 3 дней после окончания предыдущей регистрации',
                    'Когда студенту позвонят и напомнят',
                    'Не позднее срока окончания предыдущей регистрации',
                  ],
                  correctAnswerIndex: 1,
                  onCheck: (index) {
                    if (index != null) {
                      _selectedAnswersMap[4] = index;
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                ButtonWithIcon(
                  onPressed: () {
                    _collectAnswers();
                  },
                  label: 'Завершить тестирование'.toUpperCase(),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
