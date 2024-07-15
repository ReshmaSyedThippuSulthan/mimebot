import 'dart:convert';

class PrivacyPolicyModel {
  bool? status;
  List? privacyPolicy;
  List? privacyImg;

  PrivacyPolicyModel({this.status, this.privacyPolicy, this.privacyImg});

  @override
  String toString() {
    return 'PrivacyPolicyModel(status: $status, privacyPolicy: $privacyPolicy, privacyImg: $privacyImg)';
  }

  factory PrivacyPolicyModel.fromMap(Map<String, dynamic> data) {
    return PrivacyPolicyModel(
      status: data['status'] as bool?,
      privacyPolicy: data['privacy_policy'] as List?,
      privacyImg: data['privacy_img'] as List?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'privacy_policy': privacyPolicy,
        'privacy_img': privacyImg,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PrivacyPolicyModel].
  factory PrivacyPolicyModel.fromJson(String data) {
    return PrivacyPolicyModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PrivacyPolicyModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
