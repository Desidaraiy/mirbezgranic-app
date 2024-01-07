import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/components/event_item.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/main_page/notifications_page.dart';
import 'package:mirbezgranic/utils/app_colors.dart';

import '../utils/app_icons.dart';
import '../utils/func.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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
              LocaleData.interesting_events.getString(context).toUpperCase(),
              style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.smokyBlack,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              LocaleData.interesting_events_desc.getString(context),
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.smokyBlack,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              LocaleData.interesting_events_desc2.getString(context),
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.smokyBlack,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(children: [
              EventItem(
                  title: LocaleData.yandex_afisha.getString(context),
                  desc: LocaleData.yandex_afisha_desc.getString(context),
                  buttonText:
                      LocaleData.yandex_afisha_button.getString(context),
                  link: 'https://afisha.yandex.ru/veliky-novgorod',
                  imagePath: "assets/images/first.jpg"),
              EventItem(
                  title: LocaleData.philarmonic_hall.getString(context),
                  desc: LocaleData.philarmonic_hall_desc.getString(context),
                  buttonText:
                      LocaleData.philarmonic_hall_button.getString(context),
                  link: 'https://philnov.ru/event/',
                  imagePath: 'assets/images/second.jpg'),
              EventItem(
                  title: LocaleData.cecos.getString(context),
                  desc: LocaleData.cecos_desc.getString(context),
                  buttonText: LocaleData.cecos_button.getString(context),
                  link: 'https://vk.com/novsu.event',
                  imagePath: 'assets/images/third.jpg')
            ]),
            Container(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 20),
              margin: const EdgeInsets.only(bottom: 25),
              decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(14)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleData.student_council_groups
                        .getString(context)
                        .toUpperCase(),
                    style: TextStyle(fontSize: 14, color: AppColors.smokyBlack),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LocaleData.student_council_groups_desc.getString(context),
                    style: TextStyle(fontSize: 10, color: AppColors.smokyBlack),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonWithIcon(
                          onPressed: () =>
                              Utils.launchURL('https://vk.com/studsovet.igum'),
                          label: 'ИГУМ'),
                      ButtonWithIcon(
                          onPressed: () =>
                              Utils.launchURL('https://vk.com/studsovet_ibhi'),
                          label: 'ИБХИ'),
                      ButtonWithIcon(
                          onPressed: () =>
                              Utils.launchURL('https://vk.com/studsovet_ieis'),
                          label: 'ИЭИС'),
                      ButtonWithIcon(
                          onPressed: () =>
                              Utils.launchURL('https://vk.com/studsovet_imo'),
                          label: 'ИМО'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonWithIcon(
                          onPressed: () =>
                              Utils.launchURL('https://vk.com/stud_sovet_ipt'),
                          label: 'ИПТ'),
                      ButtonWithIcon(
                          onPressed: () =>
                              Utils.launchURL('https://vk.com/studsovet.iceus'),
                          label: 'ИЦЭУС'),
                      ButtonWithIcon(
                          onPressed: () =>
                              Utils.launchURL('https://vk.com/studsovet_inpo'),
                          label: 'ИНПО'),
                      ButtonWithIcon(
                          onPressed: () =>
                              Utils.launchURL('https://vk.com/studsovet_iur'),
                          label: 'ИЮР'),
                    ],
                  )
                ],
              ),
            ),
            Column(
                // children: List.generate(
                //   eventsBottom.length,
                //   (index) => EventItem(
                //     title: eventsBottom[index].title,
                //     desc: eventsBottom[index].desc,
                //     buttonText: eventsBottom[index].buttonText,
                //     link: eventsBottom[index].link,
                //     imagePath: eventsBottom[index].imagePath,
                //   ),
                // ),
                children: [
                  EventItem(
                      title: LocaleData.mirage_cinema.getString(context),
                      desc: LocaleData.mirage_cinema_desc.getString(context),
                      buttonText:
                          LocaleData.mirage_cinema_button.getString(context),
                      link: 'https://www.mirage.ru/nov/',
                      imagePath: 'assets/images/four.jpg'),
                  EventItem(
                      title: LocaleData.cinema_russia.getString(context),
                      desc: LocaleData.cinema_russia_desc.getString(context),
                      buttonText:
                          LocaleData.cinema_russia_button.getString(context),
                      link: 'https://kino53.ru/kinoafisha',
                      imagePath: 'assets/images/five.jpg')
                ]),
          ],
        ),
      ),
    );
  }
}
