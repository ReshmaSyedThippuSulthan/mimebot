import 'dart:convert';

import 'package:mimebot/features/about/model/aboutusmodel.dart';
import 'package:http/http.dart' as http;
import 'package:mimebot/features/privacy_policy/model/privacy_policy_model.dart';

class PrivacyPolicyController {
  static String fullApi =
      "http://restapi.mimebot.in/UserApi/Trash/privacy_policy";
  static Future<PrivacyPolicyModel?> PrivacyPolicyScreen() async {
    final response = await http.post(Uri.parse(fullApi),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"api_key": "mimebot@123"}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return PrivacyPolicyModel.fromJson(response.body);
    } else {
      print("data is not show");
    }
    return null;
  }
}
