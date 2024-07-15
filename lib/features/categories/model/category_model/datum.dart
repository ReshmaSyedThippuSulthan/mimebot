import 'dart:convert';

class Datum {
  int? categoryId;
  String? categoryName;
  String? categoryImage;
  int? categoryStatus;
  int? isDeleted;
  String? createdDt;
  dynamic updatedDt;

  Datum({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categoryStatus,
    this.isDeleted,
    this.createdDt,
    this.updatedDt,
  });

  @override
  String toString() {
    return 'Datum(categoryId: $categoryId, categoryName: $categoryName, categoryImage: $categoryImage, categoryStatus: $categoryStatus, isDeleted: $isDeleted, createdDt: $createdDt, updatedDt: $updatedDt)';
  }

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        categoryId: data['category_id'] as int?,
        categoryName: data['category_name'] as String?,
        categoryImage: data['category_image'] as String?,
        categoryStatus: data['category_status'] as int?,
        isDeleted: data['is_deleted'] as int?,
        createdDt: data['created_dt'] as String?,
        updatedDt: data['updated_dt'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'category_id': categoryId,
        'category_name': categoryName,
        'category_image': categoryImage,
        'category_status': categoryStatus,
        'is_deleted': isDeleted,
        'created_dt': createdDt,
        'updated_dt': updatedDt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());
}
