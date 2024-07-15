import 'dart:convert';

class Data {
  int? regId;
  String? userName;
  String? userImg;
  String? email;
  String? mobileNumber;
  int? otpNumber;

  Data({
    this.regId,
    this.userName,
    this.userImg,
    this.email,
    this.mobileNumber,
    this.otpNumber,
  });

  @override
  String toString() {
    return 'Data(regId: $regId, userName: $userName, userImg: $userImg, email: $email, mobileNumber: $mobileNumber, otpNumber: $otpNumber)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        regId: data['reg_id'] as int?,
        userName: data['user_name'] as String?,
        userImg: data['user_img'] as String?,
        email: data['email'] as String?,
        mobileNumber: data['mobile_number'] as String?,
        otpNumber: data['otp_number'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'reg_id': regId,
        'user_name': userName,
        'user_img': userImg,
        'email': email,
        'mobile_number': mobileNumber,
        'otp_number': otpNumber,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
