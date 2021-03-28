import 'package:pc_build_app/app/data/models/product_page_model.dart';

mixin Scrapper {
  String siteUrl = '';
  Map<String, String> categoryUrls = {};
  String localUrl = '';

  Future<ProductPageModel> getProducts({
    required category,
    required page,
  }) async {
    return Future.value();
  }
}
