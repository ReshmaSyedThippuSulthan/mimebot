import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mimebot/features/otp_screen/model/otp_model/otp_model.dart';

class OtpController {
  static String fullUrl = "http://restapi.mimebot.in/UserApi/otp_verify";
  static Future<OtpModel?> otpScreen(
      {required String phone, required String otpVerify}) async {
    final response = await http.post(Uri.parse(fullUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
            {"api_key": "mimebot@123", "phone": phone, "otp": otpVerify}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return OtpModel.fromJson(response.body);
    } else {
      print("data is not show");
    }
    return null;
  }
}
