import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mirbezgranic/main_page/main_page.dart';
import 'package:mirbezgranic/models/user.dart';
import 'package:mirbezgranic/pages/data_list_page.dart';
import 'package:mirbezgranic/pages/first_page.dart';
import 'package:mirbezgranic/pages/register.dart';
import 'package:mirbezgranic/repository/userRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        initStart();
      });
    });

    super.initState();
  }

  Future<void> getFirebaseToken(User user) async {
    String? token = await user.getIdToken();
    print("token $token");
  }

  void initStart() async {
    Firebase.initializeApp().then((value) async {
      User? user = FirebaseAuth.instance.currentUser;
      UserModel localUser = await LocalUserRepository.getUser();
      if (user != null && user.phoneNumber != null) {
        if (localUser.birthday != null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        } else {
          getFirebaseToken(user);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const DataListPage()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const FirstPage()));
      }
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        ),
      ),
    );
  }
}
