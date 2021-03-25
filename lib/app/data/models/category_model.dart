import 'dart:convert';

class CategoryModel {
  String code;
  String name;
  String thumb;
  CategoryModel({
    required this.code,
    required this.name,
    required this.thumb,
  });

  CategoryModel copyWith({
    String? code,
    String? name,
    String? thumb,
  }) {
    return CategoryModel(
      code: code ?? this.code,
      name: name ?? this.name,
      thumb: thumb ?? this.thumb,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'thumb': thumb,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      code: map['code'],
      name: map['name'],
      thumb: map['thumb'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryModel(code: $code, name: $name, thumb: $thumb)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.code == code &&
        other.name == name &&
        other.thumb == thumb;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ thumb.hashCode;
}
