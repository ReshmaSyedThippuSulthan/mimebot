import 'dart:convert';

import 'package:mimebot/features/about/model/aboutusmodel.dart';
import 'package:http/http.dart' as http;

class AboutUsController {
  static String fullApi = "http://restapi.mimebot.in/UserApi/Trash/about_us";
  static Future<Aboutusmodel?> aboutUsScreen() async {
    final response = await http.post(Uri.parse(fullApi),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"api_key": "mimebot@123"}));
    if (response.statusCode == 200) {
      return Aboutusmodel.fromJson(response.body);
    } else {
      print("data is not show");
    }
    return null;
  }
}
