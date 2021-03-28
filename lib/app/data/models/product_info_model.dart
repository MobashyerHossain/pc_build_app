import 'dart:convert';

class ProductInfoModel {
  String id;
  String title;
  String url;
  String thumb;
  int price;
  ProductInfoModel({
    required this.id,
    required this.title,
    required this.url,
    required this.thumb,
    required this.price,
  });

  ProductInfoModel copyWith({
    String? id,
    String? title,
    String? url,
    String? thumb,
    int? price,
  }) {
    return ProductInfoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumb: thumb ?? this.thumb,
      price: price ?? this.price,
    );
  }

  String getPrice() {
    return this.price == 0 ? 'Out of\nStock' : 'Tk. ${this.price}';
  }

  static ProductInfoModel sampleModel() {
    return ProductInfoModel(
      id: 'id',
      title: 'title',
      url: 'url.com',
      thumb: 'thum.com',
      price: 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'thumb': thumb,
      'price': price,
    };
  }

  factory ProductInfoModel.fromMap(Map<String, dynamic> map) {
    return ProductInfoModel(
      id: map['id'],
      title: map['title'],
      url: map['url'],
      thumb: map['thumb'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductInfoModel.fromJson(String source) =>
      ProductInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BasicProductModel(id: $id, title: $title, url: $url, thumb: $thumb, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductInfoModel &&
        other.id == id &&
        other.title == title &&
        other.url == url &&
        other.thumb == thumb &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        url.hashCode ^
        thumb.hashCode ^
        price.hashCode;
  }
}
