import 'dart:convert';

class BasicProductInfoModel {
  String id;
  String title;
  String url;
  String thumb;
  int price;
  BasicProductInfoModel({
    required this.id,
    required this.title,
    required this.url,
    required this.thumb,
    required this.price,
  });

  BasicProductInfoModel copyWith({
    String? id,
    String? title,
    String? url,
    String? thumb,
    int? price,
  }) {
    return BasicProductInfoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumb: thumb ?? this.thumb,
      price: price ?? this.price,
    );
  }

  static BasicProductInfoModel sampleModel() {
    return BasicProductInfoModel(
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

  factory BasicProductInfoModel.fromMap(Map<String, dynamic> map) {
    return BasicProductInfoModel(
      id: map['id'],
      title: map['title'],
      url: map['url'],
      thumb: map['thumb'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BasicProductInfoModel.fromJson(String source) =>
      BasicProductInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BasicProductModel(id: $id, title: $title, url: $url, thumb: $thumb, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BasicProductInfoModel &&
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
