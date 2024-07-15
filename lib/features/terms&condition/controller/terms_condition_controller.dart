import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mimebot/features/terms&condition/model/termsconditionmodel.dart';

class TermsAndConditionController {
  static String fullApi =
      "http://restapi.mimebot.in/UserApi/Trash/term_and_condition";
  static Future<Termsconditionmodel?> termsAndConditionScreen() async {
    final response = await http.post(Uri.parse(fullApi),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"api_key": "mimebot@123"}));
    if (response.statusCode == 200) {
      return Termsconditionmodel.fromJson(response.body);
    } else {
      print("data is not show");
    }
    return null;
  }
}
