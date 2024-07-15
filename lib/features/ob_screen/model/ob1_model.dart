import 'dart:convert';

import 'splash_screen.dart';

class Ob1Model {
  bool? status;
  List<SplashScreen>? splashScreen;

  Ob1Model({this.status, this.splashScreen});

  @override
  String toString() => 'Ob1Model(status: $status, splashScreen: $splashScreen)';

  factory Ob1Model.fromMap(Map<String, dynamic> data) => Ob1Model(
        status: data['Status'] as bool?,
        splashScreen: (data['splash_screen'] as List<dynamic>?)
            ?.map((e) => SplashScreen.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'Status': status,
        'splash_screen': splashScreen?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Ob1Model].
  factory Ob1Model.fromJson(String data) {
    return Ob1Model.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Ob1Model] to a JSON string.
  String toJson() => json.encode(toMap());
}
