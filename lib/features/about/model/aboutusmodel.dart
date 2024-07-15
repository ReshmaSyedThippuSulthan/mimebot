import 'dart:convert';

class Aboutusmodel {
  bool? status;
  List? aboutUs;
  List? aboutImg;

  Aboutusmodel({this.status, this.aboutUs, this.aboutImg});

  @override
  String toString() {
    return 'Aboutusmodel(status: $status, aboutUs: $aboutUs, aboutImg: $aboutImg)';
  }

  factory Aboutusmodel.fromMap(Map<String, dynamic> data) => Aboutusmodel(
        status: data['status'] as bool?,
        aboutUs: data['about_us'] as List?,
        aboutImg: data['about_img'] as List?,
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'about_us': aboutUs,
        'about_img': aboutImg,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Aboutusmodel].
  factory Aboutusmodel.fromJson(String data) {
    return Aboutusmodel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Aboutusmodel] to a JSON string.
  String toJson() => json.encode(toMap());
}
