import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/pages/otp_page.dart';
import 'package:mirbezgranic/utils/app_colors.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
  static String verifyId = "";
}

class _RegisterState extends State<Register> {
  final TextEditingController _phoneController = TextEditingController();
  String? errorMessagePhone;
  bool isLoading = false;
  bool isAuthError = false;

  Future<void> _verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) {
          print("Firebase Auth : ${credential.token}");
        },
        verificationFailed: (FirebaseAuthException error) {
          setState(() {
            if (error.code == 'invalid-phone-number') {
              errorMessagePhone = LocaleData.invalid_phone.getString(context);
            } else {
              errorMessagePhone = error.message.toString();
            }
            isAuthError = true;
            isLoading = false;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            isAuthError = false;
            isLoading = false;
          });
          Register.verifyId = verificationId;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpPage(
                  phoneNumber: _phoneController.text.toString(),
                ),
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void validatePhone() {
    setState(() {
      errorMessagePhone = _phoneController.text.isEmpty
          ? LocaleData.error_phone.getString(context)
          : null;
    });
    if (errorMessagePhone == null) {
      _verifyPhoneNumber();
      setState(() {
        isLoading = true;
      });
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
      ),
      body: Padding(
        padding: EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              LocaleData.enter_phone.getString(context),
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w800,
                  color: AppColors.smokyBlack),
            ),
            const SizedBox(height: 8.0),
            Text(
              LocaleData.for_register.getString(context),
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray),
            ),
            const SizedBox(height: 32.0),
            TextField(
              controller: _phoneController,
              cursorColor: AppColors.gray,
              decoration: InputDecoration(
                errorText: errorMessagePhone,
                errorMaxLines: 3,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gray, width: 2.0),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.darkBlue2, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.phone,
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
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                  validatePhone();
                  print('Entered phone number: ${_phoneController.text}');
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
