import 'dart:convert';

import 'package:mimebot/features/create_new_screen/model/registermodelapi.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  static String fullUrl = "http://restapi.mimebot.in/UserApi/register";
  static Future<Registermodelapi?> registerScreen(
    String name,
    String email,
    String phoneno,
    String password,
    String confirmPassword,
  ) async {
    final response = await http.post(Uri.parse(fullUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "api_key": "mimebot@123",
          "user_name": name,
          "phone": phoneno,
          "email": email,
          "password": password,
          "confrm_pass": confirmPassword
        }));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Registermodelapi.fromJson(response.body);
    } else {
      print("Data's is something error");
    }
    return null;
  }
}
