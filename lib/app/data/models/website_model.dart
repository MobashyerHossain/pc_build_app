import 'dart:convert';
import 'package:flutter/foundation.dart';

class WebsiteModel {
  String name;
  String logo;
  Map<String, String> categoryList;
  WebsiteModel({
    required this.name,
    required this.logo,
    required this.categoryList,
  });

  WebsiteModel copyWith({
    String? name,
    String? logo,
    Map<String, String>? categoryList,
  }) {
    return WebsiteModel(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      categoryList: categoryList ?? this.categoryList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'logo': logo,
      'categoryList': categoryList,
    };
  }

  factory WebsiteModel.fromMap(Map<String, dynamic> map) {
    return WebsiteModel(
      name: map['name'],
      logo: map['logo'],
      categoryList: Map<String, String>.from(map['categoryList']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WebsiteModel.fromJson(String source) =>
      WebsiteModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'WebsiteModel(name: $name, logo: $logo, categoryList: $categoryList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WebsiteModel &&
        other.name == name &&
        other.logo == logo &&
        mapEquals(other.categoryList, categoryList);
  }

  @override
  int get hashCode => name.hashCode ^ logo.hashCode ^ categoryList.hashCode;
}
