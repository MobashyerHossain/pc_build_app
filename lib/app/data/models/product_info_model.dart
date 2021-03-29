import 'dart:convert';

class ProductInfoModel {
  String id;
  String title;
  String url;
  String thumb;
  int price;
  String spacialNote;
  ProductInfoModel({
    required this.id,
    required this.title,
    required this.url,
    required this.thumb,
    required this.price,
    required this.spacialNote,
  });

  ProductInfoModel copyWith({
    String? id,
    String? title,
    String? url,
    String? thumb,
    int? price,
    String? spacialNote,
  }) {
    return ProductInfoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumb: thumb ?? this.thumb,
      price: price ?? this.price,
      spacialNote: spacialNote ?? this.spacialNote,
    );
  }

  String getPrice() {
    return this.price == 0 ? 'Price: N/A' : 'Tk. ${this.price}';
  }

  static ProductInfoModel sampleModel() {
    return ProductInfoModel(
      id: 'id',
      title: 'title',
      url: 'url.com',
      thumb: 'thum.com',
      price: 0,
      spacialNote: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'thumb': thumb,
      'price': price,
      'spacialNote': spacialNote,
    };
  }

  factory ProductInfoModel.fromMap(Map<String, dynamic> map) {
    return ProductInfoModel(
      id: map['id'],
      title: map['title'],
      url: map['url'],
      thumb: map['thumb'],
      price: map['price'],
      spacialNote: map['spacialNote'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductInfoModel.fromJson(String source) =>
      ProductInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductInfoModel(id: $id, title: $title, url: $url, thumb: $thumb, price: $price, spacialNote: $spacialNote)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductInfoModel &&
        other.id == id &&
        other.title == title &&
        other.url == url &&
        other.thumb == thumb &&
        other.price == price &&
        other.spacialNote == spacialNote;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        url.hashCode ^
        thumb.hashCode ^
        price.hashCode ^
        spacialNote.hashCode;
  }
}
