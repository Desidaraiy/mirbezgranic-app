import 'dart:convert';
import 'package:http/http.dart';
import 'package:mirbezgranic/models/user.dart';
import 'package:mirbezgranic/utils/const.dart';

class ServerRepository {
  static Future<bool> sendAcademicEmail(
      int id, int type, Map<String, dynamic> form) async {
    final String url = AppConst.kApiRoot + '/sendAcademicEmail';
    final Map<String, dynamic> _data = {'id': id, 'type': type, 'form': form};
    final client = Client();
    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(_data),
    );
    return response.statusCode == 200;
  }

  static Future<bool> sendRVPOEmail(int id, int type) async {
    final String url = AppConst.kApiRoot + '/sendRVPOEmail';
    final Map<String, dynamic> _data = {
      'id': id,
      'type': type,
    };
    final client = Client();
    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(_data),
    );
    return response.statusCode == 200;
  }

  static Future<bool> sendEmailSos(int id, String message) async {
    final String url = AppConst.kApiRoot + '/sendEmailSos';
    final Map<String, dynamic> _data = {
      'id': id,
      'message': message,
    };
    final client = Client();
    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(_data),
    );
    return response.statusCode == 200;
  }

  static Future<UserModel?> getUser(String phone) async {
    final String url = AppConst.kApiRoot + '/auth';
    final Map<String, String> _data = {
      'phone': phone,
    };
    final client = Client();
    final response = await client.post(
      Uri.parse(url),
      body: _data,
    );
    final jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      if (jsonData['success'] == true) {
        return UserModel.fromJson(jsonData['user']);
      }
    }
    return null;
  }

  static Future<bool> takeACourse(UserModel user) async {
    final String url = AppConst.kApiRoot + '/takeACourse';
    final Map<String, dynamic> _data = {
      'phone': user.phone,
    };
    final client = Client();
    final response = await client.post(
      Uri.parse(url),
      body: _data,
    );
    return response.statusCode == 200;
  }

  static Future<bool> registerUser(UserModel user) async {
    final String url = AppConst.kApiRoot + '/register';
    final Map<String, dynamic> _data = user.toJson();
    print('data is ${_data.toString()}');
    final client = Client();
    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(_data),
    );
    final jsonData = json.decode(response.body);
    print('jsonData is ${jsonData.toString()}');
    return response.statusCode == 200;
  }

  static Map<String, dynamic> replaceZerosWithEmptyStrings(
      Map<String, dynamic> data) {
    final Map<String, dynamic> updatedData = {};
    data.forEach((key, value) {
      if (value == null) {
        updatedData[key] = '';
      } else {
        updatedData[key] = value;
      }
    });
    return updatedData;
  }
}
