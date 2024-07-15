import 'dart:convert';

class SplashScreen {
  int? id;
  String? title;
  String? description;
  String? image;
  int? status;
  String? createdDt;
  String? updatedDt;

  SplashScreen({
    this.id,
    this.title,
    this.description,
    this.image,
    this.status,
    this.createdDt,
    this.updatedDt,
  });

  @override
  String toString() {
    return 'SplashScreen(id: $id, title: $title, description: $description, image: $image, status: $status, createdDt: $createdDt, updatedDt: $updatedDt)';
  }

  factory SplashScreen.fromMap(Map<String, dynamic> data) => SplashScreen(
        id: data['id'] as int?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        image: data['image'] as String?,
        status: data['status'] as int?,
        createdDt: data['created_dt'] as String?,
        updatedDt: data['updated_dt'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'status': status,
        'created_dt': createdDt,
        'updated_dt': updatedDt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SplashScreen].
  factory SplashScreen.fromJson(String data) {
    return SplashScreen.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SplashScreen] to a JSON string.
  String toJson() => json.encode(toMap());
}
