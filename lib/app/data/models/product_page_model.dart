import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pc_build_app/app/data/models/brand_model.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';

class ProductPageModel {
  int page;

  bool nextPageAvailable;
  bool previousPageAvailable;
  String category;
  String website;
  List<ProductInfoModel> productList;
  List<BrandModel> brandList;
  ProductPageModel({
    required this.page,
    required this.nextPageAvailable,
    required this.previousPageAvailable,
    required this.category,
    required this.website,
    required this.productList,
    required this.brandList,
  });

  static ProductPageModel sampleModel() {
    return ProductPageModel(
      page: 1,
      category: 'casing',
      website: 'ryans',
      nextPageAvailable: false,
      previousPageAvailable: false,
      productList: [
        ProductInfoModel.sampleModel(),
      ],
      brandList: [
        BrandModel.sampleModel(),
      ],
    );
  }

  ProductPageModel copyWith({
    int? page,
    String? category,
    String? website,
    bool? nextPageAvailable,
    bool? previousPageAvailable,
    List<ProductInfoModel>? productList,
    List<BrandModel>? brandList,
  }) {
    return ProductPageModel(
      page: page ?? this.page,
      category: category ?? this.category,
      website: website ?? this.website,
      nextPageAvailable: nextPageAvailable ?? this.nextPageAvailable,
      previousPageAvailable:
          previousPageAvailable ?? this.previousPageAvailable,
      productList: productList ?? this.productList,
      brandList: brandList ?? this.brandList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'category': category,
      'website': website,
      'nextPageAvailable': nextPageAvailable,
      'previousPageAvailable': previousPageAvailable,
      'productList': productList.map((x) => x.toMap()).toList(),
      'brandList': brandList.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductPageModel.fromMap(Map<String, dynamic> map) {
    return ProductPageModel(
      page: map['page'],
      category: map['category'],
      website: map['website'],
      nextPageAvailable: map['nextPageAvailable'],
      previousPageAvailable: map['previousPageAvailable'],
      productList: List<ProductInfoModel>.from(
          map['productList']?.map((x) => ProductInfoModel.fromMap(x))),
      brandList: List<BrandModel>.from(
          map['brandList']?.map((x) => BrandModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductPageModel.fromJson(String source) =>
      ProductPageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductPageModel(page: $page, category: $category, website: $website, nextPageAvailable: $nextPageAvailable, previousPageAvailable: $previousPageAvailable, productList: $productList, brandList: $brandList)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductPageModel &&
        other.page == page &&
        other.category == category &&
        other.website == website &&
        other.nextPageAvailable == nextPageAvailable &&
        other.previousPageAvailable == previousPageAvailable &&
        listEquals(other.productList, productList) &&
        listEquals(other.brandList, brandList);
  }

  @override
  int get hashCode {
    return page.hashCode ^
        category.hashCode ^
        website.hashCode ^
        nextPageAvailable.hashCode ^
        previousPageAvailable.hashCode ^
        productList.hashCode ^
        brandList.hashCode;
  }
}
