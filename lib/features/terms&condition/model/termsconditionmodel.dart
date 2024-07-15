import 'dart:convert';

class Termsconditionmodel {
  bool? status;
  List? terms;
  List? termImg;

  Termsconditionmodel({this.status, this.terms, this.termImg});

  @override
  String toString() {
    return 'Termsconditionmodel(status: $status, terms: $terms, termImg: $termImg)';
  }

  factory Termsconditionmodel.fromMap(Map<String, dynamic> data) {
    return Termsconditionmodel(
      status: data['status'] as bool?,
      terms: data['terms'] as List?,
      termImg: data['term_img'] as List?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'terms': terms,
        'term_img': termImg,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Termsconditionmodel].
  factory Termsconditionmodel.fromJson(String data) {
    return Termsconditionmodel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Termsconditionmodel] to a JSON string.
  String toJson() => json.encode(toMap());
}
