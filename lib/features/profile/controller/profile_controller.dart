import 'dart:convert';

import 'package:mimebot/features/profile/model/profile_model/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileController {
  static String fullUrl = "http://restapi.mimebot.in/UserApi/profile";
  static Future<ProfileModel?> profileScreen(userId) async {
    final response = await http.post(Uri.parse(fullUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"api_key": "mimebot@123", "user_id": userId}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ProfileModel.fromJson(response.body);
    } else {
      print("data is not show");
    }
    return null;
  }
}
