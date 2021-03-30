import 'package:get/get.dart';
import 'package:pc_build_app/app/data/repositories/product_search_repository.dart';
import 'package:pc_build_app/app/routes/app_pages.dart';

class ProductSearchController extends GetxController {
  final ProductSearchRepository _searchProvider =
      Get.find<ProductSearchRepository>();

  final _searchOn = false.obs;
  final _searchKey = ''.obs;

  setSearchOn(value) => this._searchOn.value = value;
  getSearchOn() => this._searchOn.value;

  setSearchKey(value) => this._searchKey.value = value;
  getSearchKey() => this._searchKey.value;

  fetchSearchResult() {
    _searchProvider.getSearchResult(getSearchKey());
  }

  searchProducts() {
    print(getSearchKey());
    Get.toNamed(Routes.SEARCH);
    // fetchSearchResult();
  }
}
