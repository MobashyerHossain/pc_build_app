import 'package:get/get.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'package:pc_build_app/app/data/providers/product_search/ryans_product_search_provider.dart';
import 'package:pc_build_app/app/data/providers/product_search/startech_product_search_provider.dart';
import 'package:pc_build_app/app/data/providers/product_search/techland_product_search_provider.dart';

class ProductSearchRepository {
  // final RyansProductSearchProvider _ryanScrapper =
  //     Get.find<RyansProductSearchProvider>();
  final StartechProductSearchProvider _starScrapper =
      Get.find<StartechProductSearchProvider>();
  // final TechlandProductSearchProvider _techScrapper =
  //     Get.find<TechlandProductSearchProvider>();

  final searchResult = List<ProductInfoModel>.empty(growable: true);

  Stream<List<ProductInfoModel>> getSearchResult(String searchKey) {
    final startechSearchResults =
        _starScrapper.getSearchResult(searchKey: searchKey);

    // final ryansSearchResults =
    //     _ryanScrapper.getSearchResult(searchKey: searchKey);

    // final techlandSearchResults =
    //     _techScrapper.getSearchResult(searchKey: searchKey);

    startechSearchResults.then(
      (value) => value.forEach(
        (element) {
          print(element.title);
        },
      ),
    );

    // return searchResult.shuffle();
    return Stream.fromFutures([
      startechSearchResults,
      // ryansSearchResults,
      // techlandSearchResults,
    ]).distinct();
  }
}
