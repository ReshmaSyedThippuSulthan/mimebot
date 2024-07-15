import 'dart:convert';

class Data {
  dynamic regId;
  String? userName;
  String? phone;
  String? email;
  String? password;
  int? otp;

  Data({
    this.regId,
    this.userName,
    this.phone,
    this.email,
    this.password,
    this.otp,
  });

  @override
  String toString() {
    return 'Data(regId: $regId, userName: $userName, phone: $phone, email: $email, password: $password, otp: $otp)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        regId: data['reg_id'] as dynamic,
        userName: data['user_name'] as String?,
        phone: data['phone'] as String?,
        email: data['email'] as String?,
        password: data['password'] as String?,
        otp: data['otp'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'reg_id': regId,
        'user_name': userName,
        'phone': phone,
        'email': email,
        'password': password,
        'otp': otp,
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
