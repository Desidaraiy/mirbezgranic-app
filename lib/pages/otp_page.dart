import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/main_page/main_page.dart';
import 'package:mirbezgranic/models/user.dart';
import 'package:mirbezgranic/pages/data_list_page.dart';
import 'package:mirbezgranic/pages/register.dart';
import 'package:mirbezgranic/repository/serverRepository.dart';
import 'package:mirbezgranic/repository/userRepository.dart';
import 'package:mirbezgranic/utils/app_colors.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  OtpPage({super.key, required this.phoneNumber});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _otpcodeController = TextEditingController();
  String? errorMessageAuth;
  bool isLoading = false;

  Future<void> _signIn() async {
    UserModel _user = await LocalUserRepository.getUser();
    try {
      PhoneAuthCredential _credential = PhoneAuthProvider.credential(
          verificationId: Register.verifyId, smsCode: _otpcodeController.text);
      await auth.signInWithCredential(_credential);
      _user.phone = widget.phoneNumber;
      await LocalUserRepository.saveUser(_user);
      UserModel? serverUser =
          await ServerRepository.getUser(widget.phoneNumber);
      if (serverUser != null) {
        _user = serverUser;
        await LocalUserRepository.saveUser(_user);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainPage()),
            (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const DataListPage()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessageAuth = e.message;
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _otpcodeController.dispose();
    super.dispose();
  }

  void validateCode() {
    setState(() {
      errorMessageAuth = _otpcodeController.text.isEmpty
          ? LocaleData.error_phone.getString(context)
          : null;
    });
    if (errorMessageAuth == null) {
      _signIn();
      isLoading = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: null),
      body: Padding(
        padding: EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              LocaleData.enter_sms_code.getString(context),
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w800,
                  color: AppColors.smokyBlack),
            ),
            const SizedBox(height: 8.0),
            Text(
              context.formatString(
                  LocaleData.we_sent_to_number, [widget.phoneNumber]),
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray),
            ),
            const SizedBox(height: 32.0),
            TextField(
              controller: _otpcodeController,
              cursorColor: AppColors.gray,
              decoration: InputDecoration(
                errorText: errorMessageAuth,
                errorMaxLines: 3,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.darkBlue2, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 50.0),
            Visibility(
              visible: !isLoading,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text(
                  LocaleData.continuee.getString(context),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  validateCode();
                },
              ),
            ),
            Visibility(
                visible: isLoading,
                child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: AppColors.darkBlue2,
                    ))),
          ],
        ),
      ),
    );
  }
}
