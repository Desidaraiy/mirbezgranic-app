import 'dart:convert';

import 'package:mirbezgranic/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserRepository {
  static Future<void> saveUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(user.toJson()));
  }

  static Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('user');
    if (jsonString == null) {
      return UserModel();
    }
    return UserModel.fromJson(json.decode(jsonString));
  }
}
