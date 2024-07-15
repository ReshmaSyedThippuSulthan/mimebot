import 'dart:convert';

class ForgotModel {
  bool? status;
  String? message;
  int? data;

  ForgotModel({this.status, this.message, this.data});

  @override
  String toString() {
    return 'ForgotModel(status: $status, message: $message, data: $data)';
  }

  factory ForgotModel.fromMap(Map<String, dynamic> data) => ForgotModel(
        status: data['status'] as bool?,
        message: data['message'] as String?,
        data: data['data'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ForgotModel].
  factory ForgotModel.fromJson(String data) {
    return ForgotModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ForgotModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
