import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mirbezgranic/components/language_button.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/pages/register.dart';
import 'package:mirbezgranic/utils/app_colors.dart';
import 'package:mirbezgranic/utils/const.dart';

import '../utils/func.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late FlutterLocalization _flutterLocalization;
  late String _selectedLanguage;
  final Uri yandexMapsUri = Uri.parse(
      'https://yandex.ru/maps/geo/772031775/?ll=58.219841%2C37.947875&z=11.36');

  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _selectedLanguage = _flutterLocalization.currentLocale!.languageCode;
  }

  void _handleLanguageSelection(String languageCode) {
    setState(() {
      _selectedLanguage = languageCode;
      _flutterLocalization.translate(_selectedLanguage);
    });
  }

  void _launchYandexMap() async {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Image.asset("assets/images/img.png"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, right: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Utils.launchURL(
                    'https://yandex.ru/maps/24/veliky-novgorod/?indoorLevel=1&ll=31.260862%2C58.542122&z=16.66'),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.location_on_sharp,
                        color: Colors.red,
                      ),
                    )),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.55,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                color: Colors.white),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.darkBlue),
                    width: 49,
                    height: 5,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    LocaleData.startTitle.getString(context),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    LocaleData.chooseLang.getString(context),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: AppColors.gray),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LanguageButton(
                        imagePath: 'assets/images/rus.png',
                        languageCode: AppConst.LANG_RU,
                        isSelected: _selectedLanguage == AppConst.LANG_RU,
                        onSelect: () =>
                            _handleLanguageSelection(AppConst.LANG_RU),
                      ),
                      LanguageButton(
                        imagePath: 'assets/images/eng.png',
                        languageCode: AppConst.LANG_EN,
                        isSelected: _selectedLanguage == AppConst.LANG_EN,
                        onSelect: () =>
                            _handleLanguageSelection(AppConst.LANG_EN),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: AppColors.darkBlue2,
                    textColor: Colors.white,
                    onPressed: () {
                      // Handle authorization logic
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ));
                    },
                    child: Text(
                      LocaleData.authorization.getString(context).toUpperCase(),
                      style: TextStyle(fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
