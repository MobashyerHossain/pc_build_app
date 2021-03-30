import 'package:get/get.dart';
import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/providers/product_list/ryans_product_list_provider.dart';
import 'package:pc_build_app/app/data/providers/product_list/startech_product_list_provider.dart';
import 'package:pc_build_app/app/data/providers/product_list/techland_product_list_provider.dart';
import 'package:pc_build_app/app/data/providers/product_search/ryans_product_search_provider.dart';
import 'package:pc_build_app/app/data/providers/product_search/startech_product_search_provider.dart';
import 'package:pc_build_app/app/data/providers/product_search/techland_product_search_provider.dart';
import 'package:pc_build_app/app/data/repositories/product_detail_repository.dart';
import 'package:pc_build_app/app/data/repositories/product_search_repository.dart';
import 'package:pc_build_app/app/data/repositories/products_repository.dart';
import 'package:pc_build_app/app/global_controller/website_controller.dart';
import 'package:pc_build_app/app/modules/details/product_detail_controller.dart';
import 'package:pc_build_app/app/modules/home/home_controller.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';
import 'package:pc_build_app/app/modules/search/search_controller.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<WebsiteController>(
      () => WebsiteController(
        ScrapperConstants.WEBSITE_RYANS,
      ),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    // Index
    Get.lazyPut<RyansProductListProvider>(
      () => RyansProductListProvider(),
    );
    Get.lazyPut<StartechProductListProvider>(
      () => StartechProductListProvider(),
    );
    Get.lazyPut<TechlandProductListProvider>(
      () => TechlandProductListProvider(),
    );
    Get.lazyPut<ProductsRepository>(
      () => ProductsRepository(),
    );
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );

    // Search
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

    // Detail
    Get.lazyPut<ProductDetailRepository>(
      () => ProductDetailRepository(),
    );
    Get.lazyPut<ProductDetailController>(
      () => ProductDetailController(),
    );
  }
}
