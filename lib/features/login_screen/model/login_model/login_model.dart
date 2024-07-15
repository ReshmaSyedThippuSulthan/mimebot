import 'dart:convert';

import 'data.dart';

class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  @override
  String toString() {
    return 'LoginModel(status: $status, message: $message, data: $data)';
  }

  factory LoginModel.fromMap(Map<String, dynamic> data) => LoginModel(
        status: data['status'] as bool?,
        message: data['message'] as String?,
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginModel].
  factory LoginModel.fromJson(String data) {
    return LoginModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
