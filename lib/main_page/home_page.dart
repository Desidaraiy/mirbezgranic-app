import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mirbezgranic/components/big_icon_card.dart';
import 'package:mirbezgranic/main_page/notifications_page.dart';

import '../utils/app_colors.dart';
import '../utils/app_icons.dart';
import '../utils/func.dart';

class HomePage extends StatefulWidget {
  final void Function(int)? onTabChange;

  const HomePage({super.key, required this.onTabChange});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 130),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () => showPanicDialog(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        elevation: 0,
                        shadowColor: Colors.transparent),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'SOS',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          size: 15,
                          Icons.phone_enabled,
                          color: Colors.white,
                        ),
                      ],
                    )),
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
            Text(
              'мир без границ'.toUpperCase(),
              style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.smokyBlack,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Данное мобильное приложение создано для адаптации иностранных студентов.',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.smokyBlack,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'В нем студенты могут ознакомиться с правилами страны, узнать о интересных мероприятиях, заказать необходимые документы, нажать на тревожную кнопку и попросить помощи.',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.smokyBlack,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BigIconCard(
                title: 'Заказать документы',
                desc:
                    'Подайте заявку на получение важных документов - справка об обучении, справка об академической задолжности',
                buttonText: 'ЗАКАЗАТЬ ДОКУМЕНТЫ',
                iconPath: AppIcons.search_doc,
                onPressed: () => widget.onTabChange!(1)),
            BigIconCard(
                title: 'Интересные мероприятия',
                desc:
                    'посещайте мероприятия нашего города, находите новых друзей и проводите свой досуг культурно',
                buttonText: 'СПИСОК МЕРОПРИЯТИЙ',
                iconPath: AppIcons.graduation,
                onPressed: () => widget.onTabChange!(2)),
            BigIconCard(
                title: 'Полезные места',
                desc:
                    'имейте под рукой расположение корпусов университета, магазинов, общежитий, кафе',
                buttonText: 'К КАРТАМ',
                iconPath: AppIcons.place,
                onPressed: () => widget.onTabChange!(3))
          ],
        ),
      ),
    );
  }
}
