import 'dart:convert';

import 'package:mimebot/features/login_screen/model/login_model/login_model.dart';
import 'package:http/http.dart' as http;

class LoginController {
  static String fullurl = "http://restapi.mimebot.in/UserApi/login";
  static Future<LoginModel?> loginScreen(
      String mobileno, String password) async {
    final response = await http.post(Uri.parse(fullurl),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "api_key": "mimebot@123",
          "phone": mobileno,
          "password": password
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return LoginModel.fromJson(response.body);
    } else {
      print("Data's is something error");
    }
    return null;
  }
}
