import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pc_build_app/app/data/models/brand_model.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';

class ProductPageModel {
  int pageNo;
  bool nextPageAvailable;
  bool previousPageAvailable;
  List<ProductInfoModel> productList;
  List<BrandModel> brandList;
  ProductPageModel({
    required this.pageNo,
    required this.nextPageAvailable,
    required this.previousPageAvailable,
    required this.productList,
    required this.brandList,
  });

  ProductPageModel copyWith({
    int? pageNo,
    bool? nextPageAvailable,
    bool? previousPageAvailable,
    List<ProductInfoModel>? productList,
    List<BrandModel>? brandList,
  }) {
    return ProductPageModel(
      pageNo: pageNo ?? this.pageNo,
      nextPageAvailable: nextPageAvailable ?? this.nextPageAvailable,
      previousPageAvailable:
          previousPageAvailable ?? this.previousPageAvailable,
      productList: productList ?? this.productList,
      brandList: brandList ?? this.brandList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pageNo': pageNo,
      'nextPageAvailable': nextPageAvailable,
      'previousPageAvailable': previousPageAvailable,
      'productList': productList.map((x) => x.toMap()).toList(),
      'brandList': brandList.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductPageModel.fromMap(Map<String, dynamic> map) {
    return ProductPageModel(
      pageNo: map['pageNo'],
      nextPageAvailable: map['nextPageAvailable'],
      previousPageAvailable: map['previousPageAvailable'],
      productList: List<ProductInfoModel>.from(
        map['productList']?.map(
          (x) => ProductInfoModel.fromMap(x),
        ),
      ),
      brandList: List<BrandModel>.from(
        map['brandList']?.map(
          (x) => BrandModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductPageModel.fromJson(String source) =>
      ProductPageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductPageModel(pageNo: $pageNo, nextPageAvailable: $nextPageAvailable, previousPageAvailable: $previousPageAvailable, productList: $productList, brandList: $brandList)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductPageModel &&
        other.pageNo == pageNo &&
        other.nextPageAvailable == nextPageAvailable &&
        other.previousPageAvailable == previousPageAvailable &&
        listEquals(other.productList, productList) &&
        listEquals(other.brandList, brandList);
  }

  @override
  int get hashCode {
    return pageNo.hashCode ^
        nextPageAvailable.hashCode ^
        previousPageAvailable.hashCode ^
        productList.hashCode ^
        brandList.hashCode;
  }
}
