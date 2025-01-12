import 'dart:convert';

import 'data.dart';

class OtpModel {
  bool? status;
  String? message;
  Data? data;

  OtpModel({this.status, this.message, this.data});

  @override
  String toString() {
    return 'OtpModel(status: $status, message: $message, data: $data)';
  }

  factory OtpModel.fromMap(Map<String, dynamic> data) => OtpModel(
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
  /// Parses the string and returns the resulting Json object as [OtpModel].
  factory OtpModel.fromJson(String data) {
    return OtpModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OtpModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
