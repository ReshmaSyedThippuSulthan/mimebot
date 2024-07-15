import 'dart:convert';

import 'data.dart';

class Registermodelapi {
  bool? status;
  String? message;
  Data? data;

  Registermodelapi({this.status, this.message, this.data});

  @override
  String toString() {
    return 'Registermodelapi(status: $status, message: $message, data: $data)';
  }

  factory Registermodelapi.fromMap(Map<String, dynamic> data) {
    return Registermodelapi(
      status: data['status'] as bool?,
      message: data['message'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Registermodelapi].
  factory Registermodelapi.fromJson(String data) {
    return Registermodelapi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Registermodelapi] to a JSON string.
  String toJson() => json.encode(toMap());
}
