import 'dart:convert';

import 'datum.dart';

class CategoryModel {
  String? status;
  String? message;
  List<Datum>? data;

  CategoryModel({this.status, this.message, this.data});

  @override
  String toString() {
    return 'CategoryModel(status: $status, message: $message, data: $data)';
  }

  factory CategoryModel.fromMap(Map<String, dynamic> data) => CategoryModel(
        status: data['status'] as String?,
        message: data['message'] as String?,
        data: (data['Data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'Data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CategoryModel].
  factory CategoryModel.fromJson(String data) {
    return CategoryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CategoryModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
