import 'dart:convert';

class Data {
  int? regId;
  String? userName;
  String? mobileNumber;
  String? email;
  String? password;
  String? userImg;
  String? deviceId;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? otpNumber;
  int? aStatus;

  Data({
    this.regId,
    this.userName,
    this.mobileNumber,
    this.email,
    this.password,
    this.userImg,
    this.deviceId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.otpNumber,
    this.aStatus,
  });

  @override
  String toString() {
    return 'Data(regId: $regId, userName: $userName, mobileNumber: $mobileNumber, email: $email, password: $password, userImg: $userImg, deviceId: $deviceId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, otpNumber: $otpNumber, aStatus: $aStatus)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        regId: data['reg_id'] as int?,
        userName: data['user_name'] as String?,
        mobileNumber: data['mobile_number'] as String?,
        email: data['email'] as String?,
        password: data['password'] as String?,
        userImg: data['user_img'] as String?,
        deviceId: data['device_id'] as String?,
        status: data['status'] as int?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        otpNumber: data['otp_number'] as int?,
        aStatus: data['a_status'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'reg_id': regId,
        'user_name': userName,
        'mobile_number': mobileNumber,
        'email': email,
        'password': password,
        'user_img': userImg,
        'device_id': deviceId,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'otp_number': otpNumber,
        'a_status': aStatus,
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
