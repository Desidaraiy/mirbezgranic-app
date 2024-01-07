import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/components/expired_date.dart';
import 'package:mirbezgranic/components/panic_dialog.dart';
import 'package:mirbezgranic/main_page/adaptation_course.dart';
import 'package:mirbezgranic/main_page/notifications_page.dart';
import 'package:mirbezgranic/models/user.dart';
import 'package:mirbezgranic/pages/info_page.dart';
import 'package:mirbezgranic/repository/userRepository.dart';
import 'package:mirbezgranic/utils/app_icons.dart';
import 'package:mirbezgranic/utils/appcontext.dart';
import 'package:mirbezgranic/utils/notifications_util.dart';

import '../components/language_button.dart';
import '../localization/locales.dart';
import '../utils/app_colors.dart';
import '../utils/const.dart';
import '../utils/forma_list.dart';
import '../utils/func.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late FlutterLocalization _flutterLocalization;
  late String _selectedLanguage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controllerBirthDay = TextEditingController();
  TextEditingController _controllerEntry = TextEditingController();
  TextEditingController _controllerVisaExpired = TextEditingController();
  TextEditingController _controllerPassportExpired = TextEditingController();
  TextEditingController _controllerUserFirstName = TextEditingController();
  TextEditingController _controllerUserLastName = TextEditingController();
  TextEditingController _controllerUserMiddleName = TextEditingController();
  TextEditingController _controllerUserEmail = TextEditingController();
  TextEditingController _controllerUserCountry = TextEditingController();
  TextEditingController _controllerUserGender = TextEditingController();
  TextEditingController _controllerUserYearAdmission = TextEditingController();
  TextEditingController _controllerUserCourse = TextEditingController();
  TextEditingController _controllerUserStudyDivision = TextEditingController();
  TextEditingController _controllerUserStudyInstitute = TextEditingController();
  TextEditingController _controllerUserStudyDirection = TextEditingController();
  TextEditingController _controllerUserContactFirstName =
      TextEditingController();
  TextEditingController _controllerUserContactLastName =
      TextEditingController();
  TextEditingController _controllerUserContactMiddleName =
      TextEditingController();
  TextEditingController _controllerUserContactEmail = TextEditingController();
  TextEditingController _controllerUserContactPhone = TextEditingController();
  TextEditingController _controllerUserContactWho = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isCheckedMapPolicy = false;
  bool isCheckedPrivacyPolicy = false;
  bool reaOnly = true;
  UserModel user = UserModel();
  List<String> _courses = ["1", "2", "3", "4", "5"];

  String _firstName = '';
  String _lastName = '';
  String _middleName = '';
  String _e_mail = '';
  String _country = '';
  String _floor = '';
  String _yearAdmission = '';
  String _course = '1';
  String _studyDivision = 'СПО';
  String _studyInstitute = 'Гуманитарный институт';
  String _studyDirection = '1';
  String _contactFirstName = '';
  String _contactLastName = '';
  String _contactMiddleName = '';
  String _contactEmail = '';
  String _contactNumber = '';
  String _contactWho = '';

  String visaExpiry = '0';
  String passportExpiry = '0';
  String arrivalDate = '0';

  NotificationUtils notificationUtils = NotificationUtils();

  @override
  void dispose() {
    _controllerBirthDay.dispose();
    _controllerEntry.dispose();
    _controllerVisaExpired.dispose();
    _controllerPassportExpired.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _selectedLanguage = _flutterLocalization.currentLocale!.languageCode;
    _setUser();
  }

  String calculateDaysRemaining(String dateString) {
    final now = DateTime.now();
    final dateFormat = DateFormat('yyyy-MM-dd');
    final targetDate = dateFormat.parse(dateString);
    final difference = targetDate.difference(now).inDays;
    return difference < 0 ? '0' : difference.toString();
  }

  String calculateDaysRemainingPlus90(String dateString) {
    final now = DateTime.now();
    final dateFormat = DateFormat('yyyy-MM-dd');
    final targetDate = dateFormat.parse(dateString);
    final newDate = targetDate.add(Duration(days: 90));
    final difference = newDate.difference(now).inDays.abs();
    return difference.toString();
  }

  void _setNotifications() {
    final Map<String, String> notification1 = {
      'date': user.documentsDateOfArrival.toString(),
      'type': 'dactyloscopy',
      'title': 'Необходимо пройти медобследование'
    };
    final Map<String, String> notification2 = {
      'date': user.documentsDateOfPassportExpiring.toString(),
      'type': 'passport',
      'title': 'Скоро закончится срок действия паспорта'
    };
    final Map<String, String> notification3 = {
      'date': user.documentsDateOfVisaExpiring.toString(),
      'type': 'visa',
      'title': 'Скоро закончится срок действия ВИЗЫ'
    };
    final List<Map<String, String>> notifications = [
      notification1,
      notification2,
      notification3
    ];
    notificationUtils.scheduleMultipleNotifications(notifications);
  }

  void _setCounters() {
    visaExpiry =
        calculateDaysRemaining(user.documentsDateOfVisaExpiring.toString());
    passportExpiry =
        calculateDaysRemaining(user.documentsDateOfPassportExpiring.toString());
    arrivalDate =
        calculateDaysRemainingPlus90(user.documentsDateOfArrival.toString());
  }

  Future<void> _setUser() async {
    UserModel _user = await LocalUserRepository.getUser();
    setState(() {
      user = _user;
    });
    print('user is ${user.toJson().toString()}');
    _controllerBirthDay.text =
        DateFormat('MMMM d, yyyy').format(user.birthday!);
    _controllerEntry.text =
        DateFormat('MMMM d, yyyy').format(user.documentsDateOfArrival!);
    _controllerVisaExpired.text =
        DateFormat('MMMM d, yyyy').format(user.documentsDateOfVisaExpiring!);
    _controllerPassportExpired.text = DateFormat('MMMM d, yyyy')
        .format(user.documentsDateOfPassportExpiring!);
    _controllerUserFirstName.text = user.name ?? '';
    _controllerUserLastName.text = user.surname ?? '';
    _controllerUserMiddleName.text = user.patronymic ?? '';
    _controllerUserEmail.text = user.email ?? '';
    _controllerUserCountry.text = user.country ?? '';
    _controllerUserGender.text = user.sex ?? '';
    _controllerUserYearAdmission.text = user.universityYearOfEntry ?? '';
    _controllerUserCourse.text = user.universityCourse ?? '';
    _controllerUserStudyDivision.text = user.universityAcademicUnit ?? '';
    _controllerUserStudyInstitute.text = user.universityUnit ?? '';
    _controllerUserStudyDirection.text = user.univeristyFaculty ?? '';
    _controllerUserContactFirstName.text = user.contactPersonName ?? '';
    _controllerUserContactLastName.text = user.contactPersonSurname ?? '';
    _controllerUserContactMiddleName.text = user.contactPersonPatronymic ?? '';
    _controllerUserContactEmail.text = user.contactPersonEmail ?? '';
    _controllerUserContactPhone.text = user.contactPersonPhone ?? '';
    _controllerUserContactWho.text = user.contactPersonIsForMe ?? '';
    _course =
        _courses.firstWhere((element) => element == user.universityCourse);
    _studyDivision = FormList.divisions
        .firstWhere((element) => element == user.universityAcademicUnit);
    _studyInstitute = user.universityUnit ?? '';
    _studyDirection = user.univeristyFaculty ?? '';
    _setCounters();
    _setNotifications();
  }

  void _handleLanguageSelection(String languageCode, BuildContext context) {
    setState(() {
      _selectedLanguage = languageCode;
      AppContext.currentContext = context;
      _flutterLocalization.translate(_selectedLanguage);
    });
  }

  void toInfoPage(String title, String htmlText) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoPage(
            title: title,
            html: htmlText,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(
                left: 24, right: 24, top: 50, bottom: 130),
            child: Column(
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
                        // notificationUtils.scheduleSingleNotification();
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleData.acclimatisation_course_head
                                      .getString(context),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.smokyBlack,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  LocaleData.acclimatisation_course_desc
                                      .getString(context),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.smokyBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          SvgPicture.asset(AppIcons.course)
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ButtonWithIcon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AdaptationCourseView(),
                                    ));
                              },
                              label: LocaleData
                                  .acclimatisation_course_desc_button
                                  .getString(context)
                                  .toUpperCase()),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              LocaleData.acclimatisation_course_desc_post
                                  .getString(context),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontSize: 9,
                                color: AppColors.smokyBlack,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ExpiredDate(
                    title: LocaleData.days_left_until_passport_expiry
                        .getString(context)
                        .toUpperCase(),
                    day: passportExpiry,
                    onPressed: () => toInfoPage(
                        '$passportExpiry дней до окончания срока паспорта',
                        passportHtmlText)),
                const SizedBox(
                  height: 10,
                ),
                ExpiredDate(
                    title: LocaleData.days_left_until_visa_expiry
                        .getString(context)
                        .toUpperCase(),
                    day: visaExpiry,
                    onPressed: () => toInfoPage(
                        '$visaExpiry дней до окончания срока визы',
                        visaHtmlText)),
                const SizedBox(
                  height: 10,
                ),
                ExpiredDate(
                    title: LocaleData.days_left_to_get_fingerprinted
                        .getString(context)
                        .toUpperCase(),
                    day: arrivalDate,
                    onPressed: () => toInfoPage(
                        '$arrivalDate дней для прохождения обследования',
                        examinationDaysHtmlText)),
                const SizedBox(
                  height: 10,
                ),
                ExpiredDate(
                    title: LocaleData.registration_and_renewal_of_registration
                        .getString(context)
                        .toUpperCase(),
                    onPressed: () => toInfoPage(
                        'Постановка на регистрацию и продление регистрации',
                        registrationHtmlText)),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleData.language.getString(context),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.smokyBlack),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        LanguageButton(
                          imagePath: 'assets/images/rus.png',
                          languageCode: AppConst.LANG_RU,
                          isSelected: _selectedLanguage == AppConst.LANG_RU,
                          onSelect: () => _handleLanguageSelection(
                              AppConst.LANG_RU, context),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        LanguageButton(
                          imagePath: 'assets/images/eng.png',
                          languageCode: AppConst.LANG_EN,
                          isSelected: _selectedLanguage == AppConst.LANG_EN,
                          onSelect: () => _handleLanguageSelection(
                              AppConst.LANG_EN, context),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          LocaleData.personal_data.getString(context),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: AppColors.smokyBlack),
                        ),
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.name,
                        controller: _controllerUserLastName,
                        readOnly: reaOnly,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText: LocaleData.surname.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _lastName = value ?? '';
                        },
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.name,
                        controller: _controllerUserFirstName,
                        readOnly: reaOnly,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText: LocaleData.last_name.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _firstName = value ?? '';
                        },
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.name,
                        controller: _controllerUserMiddleName,
                        readOnly: reaOnly,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText: LocaleData.paternical.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _middleName = value ?? '';
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleData.date_of_birth.getString(context),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.smokyBlack,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                // initialValue: 'August 07, 2002',
                                controller: _controllerBirthDay,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.gray,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.calendar_month,
                                      color: AppColors.darkBlue2,
                                    ),
                                    onPressed: () {},
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                  // Focused border
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.gray, width: 2.0),
                                  ),
                                  // Enabled border
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                  // Disabled border
                                  disabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                ),
                                readOnly: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.emailAddress,
                        readOnly: reaOnly,
                        // initialValue: 'test@gmail.com',
                        controller: _controllerUserEmail,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText: LocaleData.e_mail.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _e_mail = value ?? '';
                        },
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.name,
                        // initialValue: 'Turkmenistan',
                        controller: _controllerUserCountry,
                        readOnly: reaOnly,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText: LocaleData.your_country.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _country = value ?? '';
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleData.floor.getString(context),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.smokyBlack,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: DropdownButtonFormField<String>(
                                  isExpanded: false,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: AppColors.lightGreen,
                                          width: 2),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: AppColors.lightGreen,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: AppColors.gray, width: 2),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 32, 0, 0),
                                    hintStyle:
                                        const TextStyle(color: AppColors.gray),
                                    hintText:
                                        LocaleData.male.getString(context),
                                  ),
                                  dropdownColor: Colors.white,
                                  icon: const Padding(
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColors.darkBlue2,
                                    ),
                                  ),
                                  value: LocaleData.male.getString(context),
                                  items: <String>[
                                    LocaleData.male.getString(context),
                                    LocaleData.female.getString(context),
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.gray,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: null,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                        child: Text(
                          LocaleData.education.getString(context),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: AppColors.smokyBlack),
                        ),
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.number,
                        readOnly: reaOnly,
                        // initialValue: '2024',
                        controller: _controllerUserYearAdmission,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText:
                              LocaleData.year_of_admission.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _yearAdmission = value ?? '';
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleData.course_of_study.getString(context),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.smokyBlack,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: DropdownButtonFormField<String>(
                                  isExpanded: false,
                                  // value: '1',
                                  value: _course,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: AppColors.lightGreen,
                                          width: 2),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: AppColors.lightGreen,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: AppColors.gray, width: 2),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 32, 0, 0),
                                    hintStyle:
                                        const TextStyle(color: AppColors.gray),
                                    hintText: '1',
                                  ),
                                  dropdownColor: Colors.white,
                                  icon: const Padding(
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColors.darkBlue2,
                                    ),
                                  ),
                                  items: _courses.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.gray,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: null,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleData.study_division.getString(context),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.smokyBlack,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                                child: DropdownButtonFormField<String>(
                              value: _studyDivision,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.gray, width: 2),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 32, 0, 0),
                                hintStyle:
                                    const TextStyle(color: AppColors.gray),
                                hintText: LocaleData.name.getString(context),
                              ),
                              dropdownColor: Colors.white,
                              icon: const Padding(
                                padding: EdgeInsets.only(right: 20.0),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.darkBlue2,
                                ),
                              ),
                              items: FormList.divisions
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.gray,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: null,
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: _studyInstitute.isNotEmpty,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleData.institutes.getString(context),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.smokyBlack,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true, // Set readOnly to true
                                    initialValue: _studyInstitute.isNotEmpty
                                        ? _studyInstitute
                                        : null,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: const BorderSide(
                                          color: AppColors.lightGreen,
                                          width: 2,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: const BorderSide(
                                          color: AppColors.lightGreen,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: const BorderSide(
                                          color: AppColors.gray,
                                          width: 2,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 32, 0, 0),
                                      hintStyle: const TextStyle(
                                          color: AppColors.gray),
                                      hintText:
                                          LocaleData.name.getString(context),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: !_studyDivision.isEmpty,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleData.direction.getString(context),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.smokyBlack,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: DropdownButtonFormField<String>(
                                  value: _studyDirection.isNotEmpty
                                      ? _studyDirection
                                      : null,
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: AppColors.lightGreen,
                                          width: 2),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: AppColors.lightGreen,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: AppColors.gray, width: 2),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 32, 0, 0),
                                    hintStyle:
                                        const TextStyle(color: AppColors.gray),
                                    hintText:
                                        LocaleData.name.getString(context),
                                  ),
                                  dropdownColor: Colors.white,
                                  icon: const Padding(
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColors.darkBlue2,
                                    ),
                                  ),
                                  items: FormList.getDirections(
                                          _studyDivision, _studyInstitute)
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value,
                                        child: RichText(
                                          textAlign: TextAlign.start,
                                          text: TextSpan(
                                            text: value,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.gray,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ));
                                  }).toList(),
                                  onChanged: null,
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                        child: Text(
                          LocaleData.contact_person.getString(context),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: AppColors.smokyBlack),
                        ),
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.name,
                        readOnly: reaOnly,
                        // initialValue: 'Testov',
                        controller: _controllerUserContactLastName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText: LocaleData.surname.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _contactFirstName = value ?? '';
                        },
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.name,
                        readOnly: reaOnly,
                        // initialValue: 'Test',
                        controller: _controllerUserContactFirstName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText: LocaleData.last_name.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _contactLastName = value ?? '';
                        },
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.name,
                        readOnly: reaOnly,
                        // initialValue: 'Testovich',
                        controller: _controllerUserContactMiddleName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText: LocaleData.paternical.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _contactMiddleName = value ?? '';
                        },
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.emailAddress,
                        readOnly: reaOnly,
                        // initialValue: 'test@gmail',
                        controller: _controllerUserContactEmail,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText: LocaleData.e_mail.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _contactEmail = value ?? '';
                        },
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.phone,
                        readOnly: reaOnly,
                        // initialValue: '+99365000000',
                        controller: _controllerUserContactPhone,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText: LocaleData.phone_number.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _contactNumber = value ?? '';
                        },
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.name,
                        readOnly: reaOnly,
                        // initialValue: 'mom',
                        controller: _controllerUserContactWho,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          labelText:
                              LocaleData.who_contact_person.getString(context),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smokyBlack,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGreen, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gray, width: 2.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          _contactWho = value ?? '';
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                        child: Text(
                          LocaleData.documentation.getString(context),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: AppColors.smokyBlack),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleData.date_of_entry.getString(context),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.smokyBlack,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                // controller: _controllerEntry,
                                // initialValue: 'Август 17,2024',
                                controller: _controllerEntry,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.gray,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.calendar_month,
                                      color: AppColors.darkBlue2,
                                    ),
                                    onPressed: () {},
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                  // Focused border
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.gray, width: 2.0),
                                  ),
                                  // Enabled border
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                  // Disabled border
                                  disabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                ),
                                readOnly: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleData.visa_expired_date.getString(context),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.smokyBlack,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                controller: _controllerVisaExpired,
                                // initialValue: 'August 17,2024',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.gray,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.calendar_month,
                                      color: AppColors.darkBlue2,
                                    ),
                                    onPressed: () {},
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                  // Focused border
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.gray, width: 2.0),
                                  ),
                                  // Enabled border
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                  // Disabled border
                                  disabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                ),
                                readOnly: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleData.passport_expiration.getString(context),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.smokyBlack,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                controller: _controllerPassportExpired,
                                // initialValue: 'August 17,2024',

                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.gray,
                                ),
                                decoration: InputDecoration(
                                  // hintText:
                                  // DateFormat('MMMM d, yyyy').format(selectedDate),
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.calendar_month,
                                      color: AppColors.darkBlue2,
                                    ),
                                    onPressed: () {},
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                  // Focused border
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.gray, width: 2.0),
                                  ),
                                  // Enabled border
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                  // Disabled border
                                  disabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightGreen,
                                        width: 2.0),
                                  ),
                                ),
                                readOnly: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
