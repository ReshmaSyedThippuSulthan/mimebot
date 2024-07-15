import 'dart:convert';

import 'package:mimebot/features/forgot_screen/model/forget_model.dart';
import 'package:http/http.dart' as http;

class ForgotController {
  static String fullUrl = "http://restapi.mimebot.in/UserApi/forgot";
  static Future<ForgotModel?> forgotScreen(phoneno) async {
    final response = await http.post(Uri.parse(fullUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"phone": phoneno}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ForgotModel.fromJson(response.body);
    } else {
      print("Data's is something error");
    }
    return null;
  }
}
