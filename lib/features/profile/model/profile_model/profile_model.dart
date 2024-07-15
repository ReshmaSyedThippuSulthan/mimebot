import 'dart:convert';

import 'data.dart';

class ProfileModel {
  bool? status;
  String? message;
  Data? data;

  ProfileModel({this.status, this.message, this.data});

  @override
  String toString() {
    return 'ProfileModel(status: $status, message: $message, data: $data)';
  }

  factory ProfileModel.fromMap(Map<String, dynamic> data) => ProfileModel(
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
  /// Parses the string and returns the resulting Json object as [ProfileModel].
  factory ProfileModel.fromJson(String data) {
    return ProfileModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
