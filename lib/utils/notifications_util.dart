import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mirbezgranic/models/message.dart';
import 'package:mirbezgranic/repository/messagesRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

class NotificationUtils {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<bool> scheduleMultipleNotifications(
      List<Map<String, String>> notifications) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    LocalMessagesRepository localMessagesRepository = LocalMessagesRepository();

    final bool isScheduled = prefs.getBool('isScheduled') ?? false;

    if (isScheduled) {
      return isScheduled;
    }

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'Системные уведомления',
      'Уведомления MIRBEZGRANIC',
      channelDescription: 'Получайте уведомления о новостях в мире без границ!',
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    bool notificationsScheduled = true;

    final now = DateTime.now();

    for (var notification in notifications) {
      final notificationDate = DateTime.parse(notification['date']!);

      if (notificationDate.isBefore(now) ||
          DateFormat('yyyy-MM-dd').format(notificationDate) ==
              DateFormat('yyyy-MM-dd').format(now)) {
        continue;
      }

      final List<int> notificationDurations = [40, 20, 7, 3];

      for (var duration in notificationDurations) {
        final scheduledDate =
            notificationDate.subtract(Duration(days: duration));
        final scheduledTime = DateTime(scheduledDate.year, scheduledDate.month,
            scheduledDate.day, 12, 30, 0);

        final scheduledDateTime = await tz.TZDateTime.from(
          scheduledTime,
          tz.local,
        );

        final scheduledDateString =
            DateFormat('yyyy-MM-dd').format(scheduledDate);

        await flutterLocalNotificationsPlugin.zonedSchedule(
            Random().nextInt(1000000),
            'Мир без границ',
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            notification['title'] ?? '',
            scheduledDateTime,
            platformChannelSpecifics,
            androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle);

        String message = notification['type'] == 'passport'
            ? 'Через ${duration.toString()} дней ваш паспорт будет недействительным'
            : notification['type'] == 'visa'
                ? 'Через ${duration.toString()} дней ваша виза будет недействительна'
                : 'В течение ${duration.toString()} дней необходимо пройти медобследование';

        MessageModel _message = MessageModel(
          title: notification['title'] ?? '',
          text: message,
          date: scheduledDateString,
        );

        localMessagesRepository.insertMessage(_message);
      }
    }

    await prefs.setBool('isScheduled', true);

    return notificationsScheduled;
  }

  Future<void> scheduleSingleNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'Системные уведомления',
      'Уведомления MIRBEZGRANIC',
      channelDescription: 'Получайте уведомления о новостях в мире без границ!',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        Random().nextInt(1000000),
        'Мир без границ',
        'Тестовое уведомление',
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
