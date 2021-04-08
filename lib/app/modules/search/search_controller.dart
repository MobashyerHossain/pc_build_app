import 'package:get/get.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'package:pc_build_app/app/data/repositories/product_search_repository.dart';
import 'package:pc_build_app/app/routes/app_pages.dart';

class ProductSearchController extends GetxController {
  final ProductSearchRepository _searchProvider =
      Get.find<ProductSearchRepository>();

  final _searchOn = false.obs;
  final _searchKey = ''.obs;
  final _searchResult = List<ProductInfoModel>.empty(growable: true).obs;

  setSearchOn(value) => this._searchOn.value = value;
  getSearchOn() => this._searchOn.value;

  setSearchKey(value) => this._searchKey.value = value;
  getSearchKey() => this._searchKey.value;

  setSearchResult(value) => this._searchResult.value = value;
  getSearchResult() => this._searchResult;

  fetchSearchResult() {
    try {
      _searchProvider
          .getSearchResult(
        getSearchKey(),
      )
          .listen(
        (event) {
          _searchResult.addAll(event);
        },
      );
    } catch (e) {
      print('Search Error Detected: $e');
    }
  }

  searchProducts() {
    print(getSearchKey());
    Get.toNamed(Routes.SEARCH);
    fetchSearchResult();
    _searchResult.forEach((element) {
      print(element);
    });
  }
}
