import 'package:get/get.dart';
import 'package:pc_build_app/app/data/providers/product_search/ryans_product_search_provider.dart';
import 'package:pc_build_app/app/data/providers/product_search/startech_product_search_provider.dart';
import 'package:pc_build_app/app/data/providers/product_search/techland_product_search_provider.dart';
import 'package:pc_build_app/app/data/repositories/product_search_repository.dart';
import 'package:pc_build_app/app/modules/search/search_controller.dart';

class ProductSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartechProductSearchProvider>(
      () => StartechProductSearchProvider(),
    );
    Get.lazyPut<RyansProductSearchProvider>(
      () => RyansProductSearchProvider(),
    );
    Get.lazyPut<TechlandProductSearchProvider>(
      () => TechlandProductSearchProvider(),
    );
    Get.lazyPut<ProductSearchRepository>(
      () => ProductSearchRepository(),
    );
    Get.lazyPut<ProductSearchController>(
      () => ProductSearchController(),
    );
  }
}
