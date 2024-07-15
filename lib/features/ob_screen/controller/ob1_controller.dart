import 'dart:convert';
import 'package:mimebot/features/ob_screen/model/ob1_model.dart';
import 'package:http/http.dart' as http;
import 'package:mimebot/features/ob_screen/model/splash_screen.dart';

class Ob1Controller {
  static String ob1Url = "http://restapi.mimebot.in/UserApi/splash_screen";
  static Future<Ob1Model?> splashScreenob1(String screenNo) async {
    print("print value");
    final response = await http.post(Uri.parse(ob1Url),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"api_key": "mimebot@123", "screen_no": screenNo}));

    if (response.statusCode == 200) {
      return Ob1Model.fromJson(response.body);
    } else {
      print("data is not show");
    }
    return null;
  }
}
