import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/localization/locales.dart';

import '../utils/app_colors.dart';

class FormListDialog extends StatefulWidget {
  final String title;
  final String desc;
  final bool isStudy;
  final Function() closeClicked;
  final Function(Map<String, dynamic>) sendMessage;

  const FormListDialog({
    super.key,
    required this.closeClicked,
    required this.sendMessage,
    required this.title,
    required this.desc,
    required this.isStudy,
  });

  @override
  State<FormListDialog> createState() => _FormListDialogState();
}

class _FormListDialogState extends State<FormListDialog> {
  TextEditingController _controllerCertificateCitizenship =
      TextEditingController();
  TextEditingController _controllerPassportNumber = TextEditingController();
  TextEditingController _controllerDateOfBirth = TextEditingController();
  TextEditingController _controllerFullVisaNameRus = TextEditingController();
  TextEditingController _controllerFullVisaNameLat = TextEditingController();
  TextEditingController _controllerCourse = TextEditingController();
  TextEditingController _controllerSpeciality = TextEditingController();
  TextEditingController _controllerGroupNumber = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerYearSchool = TextEditingController();
  TextEditingController _controllerCertificateLanguage =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  void _insertLanguage(context) {
    if (widget.isStudy) {
      _controllerCertificateLanguage.text =
          LocaleData.russian_language.getString(context).toUpperCase();
    }
  }

  void _collectFields() {
    Map<String, dynamic> data = {};
    if (widget.isStudy) {
      data['certificateCitizenship'] = _controllerCertificateCitizenship.text;
      data['passportNumber'] = _controllerPassportNumber.text;
      data['dateOfBirth'] = _controllerDateOfBirth.text;
      data['fullVisaNameRus'] = _controllerFullVisaNameRus.text;
      data['fullVisaNameLat'] = _controllerFullVisaNameLat.text;
      data['course'] = _controllerCourse.text;
      data['speciality'] = _controllerSpeciality.text;
      data['email'] = _controllerEmail.text;
      data['certificateLanguage'] = _controllerCertificateLanguage.text;
    } else {
      data['certificateCitizenship'] = _controllerCertificateCitizenship.text;
      data['fullVisaNameRus'] = _controllerFullVisaNameRus.text;
      data['fullVisaNameLat'] = _controllerFullVisaNameLat.text;
      data['course'] = _controllerCourse.text;
      data['speciality'] = _controllerSpeciality.text;
      data['groupNumber'] = _controllerGroupNumber.text;
      data['email'] = _controllerEmail.text;
      data['yearSchool'] = _controllerYearSchool.text;
    }
    widget.sendMessage(data);
  }

  @override
  Widget build(BuildContext context) {
    _insertLanguage(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: widget.closeClicked,
              child: const Icon(
                Icons.close,
                opticalSize: 5,
                color: AppColors.darkBlue2,
              ),
            ),
          ),
          Text(
            widget.title.toUpperCase(),
            style: const TextStyle(
                color: AppColors.smokyBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.desc.toUpperCase(),
            softWrap: true,
            style: const TextStyle(fontSize: 14, color: AppColors.smokyBlack),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleData.certificate_form_citizenship
                          .getString(context),
                      style:
                          TextStyle(color: AppColors.smokyBlack, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      cursorColor: AppColors.gray,
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      controller: _controllerCertificateCitizenship,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                      onSaved: (String? value) {},
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Visibility(
                  visible: widget.isStudy,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleData.certificate_form_passport_number
                            .getString(context),
                        style: TextStyle(
                            color: AppColors.smokyBlack, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        controller: _controllerPassportNumber,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                        onSaved: (String? value) {},
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.isStudy,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleData.certificate_form_birthday.getString(context),
                        style: TextStyle(
                            color: AppColors.smokyBlack, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        controller: _controllerDateOfBirth,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                        onSaved: (String? value) {},
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleData.certificate_form_name_visa_ru
                          .getString(context),
                      style:
                          TextStyle(color: AppColors.smokyBlack, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      cursorColor: AppColors.gray,
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      controller: _controllerFullVisaNameRus,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                      onSaved: (String? value) {},
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleData.certificate_form_name_visa_eng
                          .getString(context),
                      style:
                          TextStyle(color: AppColors.smokyBlack, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      cursorColor: AppColors.gray,
                      keyboardType: TextInputType.name,
                      controller: _controllerFullVisaNameLat,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                      onSaved: (String? value) {},
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleData.certificate_form_study_year.getString(context),
                      style:
                          TextStyle(color: AppColors.smokyBlack, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      cursorColor: AppColors.gray,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      controller: _controllerCourse,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                      onSaved: (String? value) {},
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Visibility(
                  visible: !widget.isStudy,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleData.certificate_form_group_number
                            .getString(context),
                        style: TextStyle(
                            color: AppColors.smokyBlack, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        controller: _controllerGroupNumber,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                        onSaved: (String? value) {},
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleData.certificate_form_study_speciality
                          .getString(context),
                      style:
                          TextStyle(color: AppColors.smokyBlack, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      cursorColor: AppColors.gray,
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      controller: _controllerSpeciality,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                      onSaved: (String? value) {},
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Visibility(
                  visible: !widget.isStudy,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleData.certificate_form_school_year
                            .getString(context),
                        style: TextStyle(
                            color: AppColors.smokyBlack, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: AppColors.gray,
                        keyboardType: TextInputType.datetime,
                        maxLines: 1,
                        controller: _controllerYearSchool,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                        onSaved: (String? value) {},
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleData.certificate_form_email.getString(context),
                      style:
                          TextStyle(color: AppColors.smokyBlack, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      cursorColor: AppColors.gray,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      controller: _controllerEmail,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                      onSaved: (String? value) {},
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Visibility(
                    visible: widget.isStudy,
                    child: Column(
                      children: [
                        Text(
                          LocaleData.certificate_form_language
                              .getString(context),
                          style: TextStyle(
                              color: AppColors.smokyBlack, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DropdownButtonFormField<String>(
                          value: LocaleData.russian_language
                              .getString(context)
                              .toUpperCase(),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            hintStyle: const TextStyle(color: AppColors.gray),
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
                            LocaleData.russian_language
                                .getString(context)
                                .toUpperCase(),
                            LocaleData.english_language
                                .getString(context)
                                .toUpperCase(),
                            LocaleData.french_language
                                .getString(context)
                                .toUpperCase()
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
                            // handle change
                            if (newValue == null) return;
                            setState(() {
                              _controllerCertificateLanguage.text = newValue;
                            });
                          },
                        ),
                      ],
                    )),
                Align(
                  alignment: Alignment.center,
                  child: ButtonWithIcon(
                      onPressed: () {
                        _collectFields();
                      },
                      label: LocaleData.trpe_certificate_button
                          .getString(context)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
