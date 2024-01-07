import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/intl.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/main_page/main_page.dart';
import 'package:mirbezgranic/models/user.dart';
import 'package:mirbezgranic/repository/serverRepository.dart';
import 'package:mirbezgranic/repository/userRepository.dart';
import 'package:mirbezgranic/utils/app_colors.dart';
import 'package:mirbezgranic/utils/forma_list.dart';

class DataListPage extends StatefulWidget {
  const DataListPage({super.key});

  @override
  State<DataListPage> createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  bool isCheckedMapPolicy = false;
  bool isCheckedPrivacyPolicy = false;

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

  @override
  void initState() {
    super.initState();
    _setDatesToControllers();
  }

  void _setDatesToControllers() {
    _controllerBirthDay.text = DateFormat('MMMM d, yyyy').format(selectedDate);
    _controllerEntry.text = DateFormat('MMMM d, yyyy').format(selectedDate);
    _controllerVisaExpired.text =
        DateFormat('MMMM d, yyyy').format(selectedDate);
    _controllerPassportExpired.text =
        DateFormat('MMMM d, yyyy').format(selectedDate);
    _controllerUserGender.text = 'Мужской';
    _controllerUserCourse.text = '1';
  }

  // String _firstName = '';
  // String _lastName = '';
  // String _middleName = '';
  // String _e_mail = '';
  // String _country = '';
  // String _floor = '';
  // String _yearAdmission = '';
  // String _course = '';
  String _studyDivision = '';
  String _studyInstitute = '';
  String _studyDirection = '';
  // String _contactFirstName = '';
  // String _contactLastName = '';
  // String _contactMiddleName = '';
  // String _contactEmail = '';
  // String _contactNumber = '';
  // String _contactWho = '';

  @override
  void dispose() {
    _controllerBirthDay.dispose();
    _controllerEntry.dispose();
    _controllerVisaExpired.dispose();
    _controllerPassportExpired.dispose();
    super.dispose();
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime initialDate = DateTime.now();
    if (controller.text.isNotEmpty) {
      initialDate = DateFormat('MMMM d, yyyy').parseStrict(controller.text);
    }
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != initialDate) {
      setState(() {
        controller.text = DateFormat('MMMM d, yyyy').format(picked);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_controllerUserFirstName.text.isEmpty ||
        _controllerUserLastName.text.isEmpty ||
        _controllerUserEmail.text.isEmpty ||
        _controllerUserCountry.text.isEmpty ||
        _controllerUserStudyDivision.text.isEmpty ||
        _controllerUserYearAdmission.text.isEmpty ||
        _controllerUserCourse.text.isEmpty ||
        _controllerUserStudyDivision.text.isEmpty ||
        _controllerUserStudyInstitute.text.isEmpty ||
        _controllerUserStudyDirection.text.isEmpty ||
        _controllerUserContactFirstName.text.isEmpty ||
        _controllerUserContactLastName.text.isEmpty ||
        _controllerUserContactEmail.text.isEmpty ||
        _controllerUserContactPhone.text.isEmpty ||
        _controllerUserContactWho.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(LocaleData.fill_all.getString(context))),
      );
      return;
    }

    if (!isCheckedMapPolicy) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Пожалуйста, подтвердите согласие на обработку персональных данных')),
      );
      return;
    }

    if (!isCheckedMapPolicy) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Пожалуйста, подтвердите согласие с условиями использования Яндекс.Карт')),
      );
      return;
    }

    UserModel _user = await LocalUserRepository.getUser();
    _user.name = _controllerUserFirstName.text;
    _user.surname = _controllerUserLastName.text;
    _user.patronymic = _controllerUserMiddleName.text;
    _user.email = _controllerUserEmail.text;
    _user.country = _controllerUserCountry.text;
    _user.sex = _controllerUserGender.text;
    _user.universityYearOfEntry = _controllerUserYearAdmission.text;
    _user.universityCourse = _controllerUserCourse.text;
    _user.universityAcademicUnit = _controllerUserStudyDivision.text;
    _user.universityUnit = _controllerUserStudyInstitute.text;
    _user.univeristyFaculty = _controllerUserStudyDirection.text;
    _user.contactPersonName = _controllerUserContactFirstName.text;
    _user.contactPersonSurname = _controllerUserContactLastName.text;
    _user.contactPersonPatronymic = _controllerUserContactMiddleName.text;
    _user.contactPersonEmail = _controllerUserContactEmail.text;
    _user.contactPersonPhone = _controllerUserContactPhone.text;
    _user.contactPersonIsForMe = _controllerUserContactWho.text;
    _user.birthday = DateFormat('MMMM d, yyyy').parse(_controllerBirthDay.text);
    _user.documentsDateOfArrival =
        DateFormat('MMMM d, yyyy').parse(_controllerEntry.text);
    _user.documentsDateOfVisaExpiring =
        DateFormat('MMMM d, yyyy').parse(_controllerVisaExpired.text);
    _user.documentsDateOfPassportExpiring =
        DateFormat('MMMM d, yyyy').parse(_controllerPassportExpired.text);
    _user.hasTakenCourse = 0;
    await LocalUserRepository.saveUser(_user);
    bool success = await ServerRepository.registerUser(_user);
    print('registered $success');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Form(
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
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                  onChanged: (value) => _controllerUserLastName.text = value,
                ),
                TextFormField(
                  cursorColor: AppColors.gray,
                  keyboardType: TextInputType.name,
                  controller: _controllerUserFirstName,
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
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                  onChanged: (value) => _controllerUserFirstName.text = value,
                ),
                TextFormField(
                  cursorColor: AppColors.gray,
                  keyboardType: TextInputType.name,
                  controller: _controllerUserMiddleName,
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
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                  onChanged: (value) => _controllerUserMiddleName.text = value,
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
                          controller: _controllerBirthDay,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray,
                          ),
                          decoration: InputDecoration(
                            hintText: DateFormat('MMMM d, yyyy', 'ru')
                                .format(selectedDate),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.calendar_month,
                                color: AppColors.darkBlue2,
                              ),
                              onPressed: () =>
                                  _selectDate(context, _controllerBirthDay),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
                            ),
                            // Focused border
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.gray, width: 2.0),
                            ),
                            // Enabled border
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
                            ),
                            // Disabled border
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
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
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                ),
                TextFormField(
                  cursorColor: AppColors.gray,
                  keyboardType: TextInputType.name,
                  controller: _controllerUserCountry,
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
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                  onChanged: (value) => _controllerUserCountry.text = value,
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
                              contentPadding: EdgeInsets.fromLTRB(20, 32, 0, 0),
                              hintStyle: const TextStyle(color: AppColors.gray),
                              hintText: LocaleData.male.getString(context),
                            ),
                            dropdownColor: Colors.white,
                            icon: const Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.darkBlue2,
                              ),
                            ),
                            items: <String>[
                              LocaleData.male.getString(context),
                              LocaleData.female.getString(context),
                            ].map<DropdownMenuItem<String>>((String value) {
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
                            onChanged: (String? newValue) {
                              // _floor = newValue ?? '';
                              _controllerUserGender.text = newValue ?? '';
                              // handle change
                            },
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
                  controller: _controllerUserYearAdmission,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray,
                  ),
                  decoration: InputDecoration(
                    labelText: LocaleData.year_of_admission.getString(context),
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.smokyBlack,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                  onChanged: (value) =>
                      _controllerUserYearAdmission.text = value,
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
                              contentPadding: EdgeInsets.fromLTRB(20, 32, 0, 0),
                              hintStyle: const TextStyle(color: AppColors.gray),
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
                            items: <String>['1', '2', '3', '4', '5']
                                .map<DropdownMenuItem<String>>((String value) {
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
                            onChanged: (String? newValue) {
                              // handle change
                              // _course = newValue ?? '';
                              _controllerUserCourse.text = newValue ?? '';
                            },
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
                          contentPadding: EdgeInsets.fromLTRB(20, 32, 0, 0),
                          hintStyle: const TextStyle(color: AppColors.gray),
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
                            .map<DropdownMenuItem<String>>((String value) {
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
                        onChanged: (String? newValue) {
                          setState(() {
                            _controllerUserStudyDivision.text = newValue ?? '';
                            _studyDivision = newValue ?? '';
                            _studyInstitute =
                                FormList.getInstitutes(_studyDivision)
                                        .contains(_studyInstitute)
                                    ? _studyInstitute
                                    : '';
                            _studyDirection = FormList.getDirections(
                                        _studyDivision, _studyInstitute)
                                    .contains(_studyDirection)
                                ? _studyDirection
                                : '';
                            ;
                          });
                          // handle change
                        },
                      )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                Visibility(
                  visible: !(_studyDivision == 'Аспирантура' ||
                      _studyDivision == 'ПО (подготовительное отделение)' ||
                      FormList.getInstitutes(_studyDivision).isEmpty),
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
                              child: DropdownButtonFormField<String>(
                            value: _studyInstitute.isNotEmpty
                                ? _studyInstitute
                                : null,
                            isExpanded: true,
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
                              contentPadding: EdgeInsets.fromLTRB(20, 32, 0, 0),
                              hintStyle: const TextStyle(color: AppColors.gray),
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
                            items: FormList.getInstitutes(_studyDivision)
                                .map<DropdownMenuItem<String>>((String value) {
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
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _controllerUserStudyInstitute.text =
                                    newValue ?? '';
                                _studyInstitute = newValue ?? '';
                                _studyDirection = '';
                              });
                            },
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: !(_studyDivision ==
                          'ПО (подготовительное отделение)' ||
                      FormList.getDirections(_studyDivision, _studyInstitute)
                          .isEmpty),
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
                              contentPadding: EdgeInsets.fromLTRB(20, 32, 0, 0),
                              hintStyle: const TextStyle(color: AppColors.gray),
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
                            items: FormList.getDirections(
                                    _studyDivision, _studyInstitute)
                                .map<DropdownMenuItem<String>>((String value) {
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
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _controllerUserStudyDirection.text =
                                    newValue ?? '';
                                _studyDirection = newValue ?? '';
                              });
                              // handle change
                            },
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
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                  onChanged: (value) =>
                      _controllerUserContactLastName.text = value,
                ),
                TextFormField(
                  cursorColor: AppColors.gray,
                  keyboardType: TextInputType.name,
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
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                  onChanged: (value) =>
                      _controllerUserContactFirstName.text = value,
                ),
                TextFormField(
                  cursorColor: AppColors.gray,
                  keyboardType: TextInputType.name,
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
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                  onChanged: (value) =>
                      _controllerUserContactMiddleName.text = value,
                ),
                TextFormField(
                  cursorColor: AppColors.gray,
                  keyboardType: TextInputType.emailAddress,
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
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                  onChanged: (value) =>
                      _controllerUserContactEmail.text = value,
                ),
                TextFormField(
                  cursorColor: AppColors.gray,
                  keyboardType: TextInputType.phone,
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
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                  onChanged: (value) =>
                      _controllerUserContactPhone.text = value,
                ),
                TextFormField(
                  cursorColor: AppColors.gray,
                  keyboardType: TextInputType.name,
                  controller: _controllerUserContactWho,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray,
                  ),
                  decoration: InputDecoration(
                    labelText: LocaleData.who_contact_person.getString(context),
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.smokyBlack,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                    ),
                  ),
                  onChanged: (value) => _controllerUserContactWho.text = value,
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
                          controller: _controllerEntry,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                DateFormat('MMMM d, yyyy').format(selectedDate),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.calendar_month,
                                color: AppColors.darkBlue2,
                              ),
                              onPressed: () =>
                                  _selectDate(context, _controllerEntry),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
                            ),
                            // Focused border
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.gray, width: 2.0),
                            ),
                            // Enabled border
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
                            ),
                            // Disabled border
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
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
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                DateFormat('MMMM d, yyyy').format(selectedDate),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.calendar_month,
                                color: AppColors.darkBlue2,
                              ),
                              onPressed: () =>
                                  _selectDate(context, _controllerVisaExpired),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
                            ),
                            // Focused border
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.gray, width: 2.0),
                            ),
                            // Enabled border
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
                            ),
                            // Disabled border
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
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
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                DateFormat('MMMM d, yyyy').format(selectedDate),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.calendar_month,
                                color: AppColors.darkBlue2,
                              ),
                              onPressed: () => _selectDate(
                                  context, _controllerPassportExpired),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
                            ),
                            // Focused border
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.gray, width: 2.0),
                            ),
                            // Enabled border
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
                            ),
                            // Disabled border
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen, width: 2.0),
                            ),
                          ),
                          readOnly: true,
                        ),
                      ),
                    ),
                  ],
                ),
                // Add other TextFormFields for each input field
                // For date fields, you can use the package 'flutter_datetime_picker'
                // For drop-down fields, you can use DropdownButtonFormField

                // For checkbox agreement
                const SizedBox(
                  height: 20,
                ),
                CheckboxListTile(
                  activeColor: AppColors.darkBlue2,
                  title: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              LocaleData.agree_terms_yandex.getString(context),
                          style: const TextStyle(
                              fontSize: 14, color: AppColors.gray),
                        ),
                        TextSpan(
                          text:
                              LocaleData.agree_terms_yandex2.getString(context),
                          style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.darkBlue2,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                  value: isCheckedMapPolicy,
                  // Это должна быть переменная состояния
                  onChanged: (bool? newValue) {
                    // Обновите состояние isChecked в вашем State классе
                    setState(() {
                      isCheckedMapPolicy = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity
                      .leading, // Расположение чекбокса слева
                  // Другие параметры, которые могут понадобиться для стилизации
                ),
                CheckboxListTile(
                  activeColor: AppColors.darkBlue2,
                  title: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              LocaleData.agree_personal_data.getString(context),
                          style: const TextStyle(
                              fontSize: 14, color: AppColors.gray),
                        ),
                        TextSpan(
                          text: LocaleData.agree_personal_data2
                              .getString(context),
                          style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.darkBlue2,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                  value: isCheckedPrivacyPolicy,
                  // Это должна быть переменная состояния
                  onChanged: (bool? newValue) {
                    // Обновите состояние isChecked в вашем State классе
                    setState(() {
                      isCheckedPrivacyPolicy = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity
                      .leading, // Расположение чекбокса слева
                  // Другие параметры, которые могут понадобиться для стилизации
                ),
                const SizedBox(
                  height: 20,
                ),

                // Add button to submit form
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBlue2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    LocaleData.register.getString(context),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    _submitForm();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
