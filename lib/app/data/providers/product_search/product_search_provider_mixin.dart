import 'package:pc_build_app/app/data/models/product_info_model.dart';

mixin ProductSearchProvider {
  String siteUrl = '';
  String searchUrl = '';

  Future<List<ProductInfoModel>> getSearchResult({
    required searchKey,
  }) async {
    return Future.value();
  }
}
