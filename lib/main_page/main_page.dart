import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mirbezgranic/components/bottom_nav_bar.dart';
import 'package:mirbezgranic/main_page/document_page.dart';
import 'package:mirbezgranic/main_page/event_page.dart';
import 'package:mirbezgranic/main_page/home_page.dart';
import 'package:mirbezgranic/main_page/locatio_page.dart';
import 'package:mirbezgranic/main_page/profile_page.dart';
import 'package:mirbezgranic/models/user.dart';
import 'package:mirbezgranic/repository/userRepository.dart';
import 'package:mirbezgranic/utils/appcontext.dart';
import '../utils/func.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 4;
  Future<void> navigateBottomBar(int index) async {
    final UserModel _user = await LocalUserRepository.getUser();
    setState(() {
      if (_user.hasTakenCourse == 1)
        _selectedIndex = index;
      else {
        showMessageDialog(context, 'У вас нет доступа',
            'Для получения доступа к функциям мобильного приложения необходимо пройти тест к курсу по адаптации студента');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AppContext.currentContext = context;
    List<Widget> pages = [
      HomePage(onTabChange: navigateBottomBar),
      DocumentsPage(),
      EventsPage(),
      LocationPage(),
      ProfilePage()
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          pages[_selectedIndex],
          BottomNavBar(
              selectedIndex: _selectedIndex, onTabChange: navigateBottomBar)
        ]));
  }
}
