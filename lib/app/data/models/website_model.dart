import 'dart:convert';

import 'package:flutter/foundation.dart';

class WebsiteModel {
  String code;
  String name;
  String logo;
  Map<String, String> categoryList;
  WebsiteModel({
    required this.code,
    required this.name,
    required this.logo,
    required this.categoryList,
  });

  static WebsiteModel getSample() {
    return WebsiteModel(
      code: '',
      name: '',
      logo: '',
      categoryList: {'': ''},
    );
  }

  WebsiteModel copyWith({
    String? code,
    String? name,
    String? logo,
    Map<String, String>? categoryList,
  }) {
    return WebsiteModel(
      code: code ?? this.code,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      categoryList: categoryList ?? this.categoryList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'logo': logo,
      'categoryList': categoryList,
    };
  }

  factory WebsiteModel.fromMap(Map<String, dynamic> map) {
    return WebsiteModel(
      code: map['code'],
      name: map['name'],
      logo: map['logo'],
      categoryList: Map<String, String>.from(map['categoryList']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WebsiteModel.fromJson(String source) =>
      WebsiteModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WebsiteModel(code: $code, name: $name, logo: $logo, categoryList: $categoryList)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WebsiteModel &&
        other.code == code &&
        other.name == name &&
        other.logo == logo &&
        mapEquals(other.categoryList, categoryList);
  }

  @override
  int get hashCode {
    return code.hashCode ^
        name.hashCode ^
        logo.hashCode ^
        categoryList.hashCode;
  }
}
