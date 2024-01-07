import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/main_page/notifications_page.dart';
import 'package:mirbezgranic/models/user.dart';
import 'package:mirbezgranic/repository/serverRepository.dart';
import 'package:mirbezgranic/repository/userRepository.dart';

import '../utils/app_colors.dart';
import '../utils/app_icons.dart';
import '../utils/func.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
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
                LocaleData.documents.getString(context).toUpperCase(),
                style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.smokyBlack,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                LocaleData.documents_desc.getString(context),
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.smokyBlack,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 20),
                    decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleData.dmrvr_desc
                              .getString(context)
                              .toUpperCase(),
                          style: TextStyle(
                              color: AppColors.smokyBlack, fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          LocaleData.dmrvr_address
                              .getString(context)
                              .toLowerCase(),
                          style: TextStyle(
                              color: AppColors.smokyBlack, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${LocaleData.dmrvr_hours.getString(context)}, 10:00-12:00, 15:00-17:00'
                              .toLowerCase(),
                          style: TextStyle(
                              color: AppColors.smokyBlack, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '+ 7 (8162) 33-20-39'.toLowerCase(),
                          style: TextStyle(
                              color: AppColors.smokyBlack, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'otdelmuvr@gmail.com'.toLowerCase(),
                          style: TextStyle(
                              color: AppColors.smokyBlack, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 20),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          decoration: BoxDecoration(
                              color: AppColors.darkBlue2,
                              borderRadius: BorderRadius.circular(50)),
                          child: SizedBox(
                            width: 9,
                            height: 9,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleData.registration_certificate
                                    .getString(context)
                                    .toUpperCase(),
                                style: TextStyle(
                                    color: AppColors.smokyBlack, fontSize: 14),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    LocaleData.registration_certificate_desc
                                        .getString(context),
                                    style: TextStyle(
                                        color: AppColors.smokyBlack,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    LocaleData.registration_certificate_desc2
                                        .getString(context),
                                    style: TextStyle(
                                        color: AppColors.smokyBlack,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    LocaleData.registration_certificate_desc3
                                        .getString(context),
                                    style: TextStyle(
                                        color: AppColors.smokyBlack,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              ButtonWithIcon(
                                  onPressed: () async {
                                    final UserModel _user =
                                        await LocalUserRepository.getUser();

                                    bool result =
                                        await ServerRepository.sendRVPOEmail(
                                            _user.id ?? 0, 1);

                                    showMessageDialog(
                                        context,
                                        LocaleData
                                            .registration_certificate_modal_title
                                            .getString(context),
                                        '${LocaleData.registration_certificate_modal_desc.getString(context)}${LocaleData.registration_certificate_modal_desc2.getString(context)}');
                                  },
                                  label: LocaleData
                                      .registration_certificate_button
                                      .getString(context)
                                      .toUpperCase()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 20),
                    decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(14),
                            bottomRight: Radius.circular(14))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          decoration: BoxDecoration(
                              color: AppColors.darkBlue2,
                              borderRadius: BorderRadius.circular(50)),
                          child: SizedBox(
                            width: 9,
                            height: 9,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${LocaleData.trpe_certificate.getString(context)} - ${LocaleData.trpe_certificate_desc.getString(context)}',
                                style: TextStyle(
                                    color: AppColors.smokyBlack, fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                LocaleData.trpe_certificate_desc
                                    .getString(context),
                                style: TextStyle(
                                    color: AppColors.smokyBlack, fontSize: 14),
                              ),
                              ButtonWithIcon(
                                  onPressed: () async {
                                    final UserModel _user =
                                        await LocalUserRepository.getUser();

                                    bool result =
                                        await ServerRepository.sendRVPOEmail(
                                            _user.id ?? 0, 0);

                                    showMessageDialog(
                                        context,
                                        LocaleData.trpe_certificate_modal_title
                                            .getString(context),
                                        '${LocaleData.trpe_certificate_modal_desc_three.getString(context)}');
                                  },
                                  label: LocaleData.trpe_certificate_button
                                      .getString(context))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 20),
                    decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleData.drws_department
                              .getString(context)
                              .toUpperCase(),
                          style: TextStyle(
                              color: AppColors.smokyBlack, fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          LocaleData.dmrvr_address
                              .getString(context)
                              .toLowerCase(),
                          style: TextStyle(
                              color: AppColors.smokyBlack, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${LocaleData.dmrvr_hours.getString(context)}, 10:00-12:00, 15:00-17:00'
                              .toLowerCase(),
                          style: TextStyle(
                              color: AppColors.smokyBlack, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '+ 7 (8162) 97-45-25'.toLowerCase(),
                          style: TextStyle(
                              color: AppColors.smokyBlack, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'fro@novsu.ru '.toLowerCase(),
                          style: TextStyle(
                              color: AppColors.smokyBlack, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 20),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          decoration: BoxDecoration(
                              color: AppColors.darkBlue2,
                              borderRadius: BorderRadius.circular(50)),
                          child: SizedBox(
                            width: 9,
                            height: 9,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleData.study_certificate.getString(context),
                                style: TextStyle(
                                    color: AppColors.smokyBlack, fontSize: 14),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    LocaleData.study_certificate_desc
                                        .getString(context),
                                    style: TextStyle(
                                        color: AppColors.smokyBlack,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    LocaleData.study_certificate_desc2
                                        .getString(context),
                                    style: TextStyle(
                                        color: AppColors.smokyBlack,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              ButtonWithIcon(
                                  onPressed: () async {
                                    final UserModel _user =
                                        await LocalUserRepository.getUser();

                                    // bool result = await ServerRepository
                                    //     .sendAcademicEmail(_user.id ?? 0, 1);

                                    Map<String, dynamic> result =
                                        await showFormListDialog(
                                            context,
                                            LocaleData.study_certificate
                                                .getString(context),
                                            LocaleData
                                                .study_certificate_modal_desc
                                                .getString(context),
                                            true);
                                    if (result.isEmpty) return;
                                    bool response = await ServerRepository
                                        .sendAcademicEmail(
                                            _user.id ?? 0, 1, result);
                                  },
                                  label: LocaleData.trpe_certificate_button
                                      .getString(context))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 20),
                    decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(14),
                            bottomRight: Radius.circular(14))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          decoration: BoxDecoration(
                              color: AppColors.darkBlue2,
                              borderRadius: BorderRadius.circular(50)),
                          child: SizedBox(
                            width: 9,
                            height: 9,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleData.academic_certificate
                                    .getString(context)
                                    .toUpperCase(),
                                style: TextStyle(
                                    color: AppColors.smokyBlack, fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                LocaleData.academic_certificate_desc
                                    .getString(context),
                                style: TextStyle(
                                    color: AppColors.smokyBlack, fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                LocaleData.academic_certificate_desc2
                                    .getString(context),
                                style: TextStyle(
                                    color: AppColors.smokyBlack, fontSize: 14),
                              ),
                              ButtonWithIcon(
                                  onPressed: () async {
                                    final UserModel _user =
                                        await LocalUserRepository.getUser();

                                    Map<String, dynamic> result =
                                        await showFormListDialog(
                                            context,
                                            LocaleData.academic_certificate
                                                .getString(context),
                                            LocaleData
                                                .academic_certificate_modal_desc
                                                .getString(context),
                                            false);
                                    if (result.isEmpty) return;
                                    bool response = await ServerRepository
                                        .sendAcademicEmail(
                                            _user.id ?? 0, 0, result);
                                  },
                                  label: LocaleData.trpe_certificate_button
                                      .getString(context))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
