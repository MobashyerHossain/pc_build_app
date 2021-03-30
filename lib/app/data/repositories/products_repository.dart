import 'package:get/get.dart';
import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/models/product_page_model.dart';
import 'package:pc_build_app/app/data/providers/product_list/ryans_product_list_provider.dart';
import 'package:pc_build_app/app/data/providers/product_list/startech_product_list_provider.dart';
import 'package:pc_build_app/app/data/providers/product_list/techland_product_list_provider.dart';

class ProductsRepository {
  final RyansProductListProvider _ryanScrapper =
      Get.find<RyansProductListProvider>();
  final StartechProductListProvider _starScrapper =
      Get.find<StartechProductListProvider>();
  final TechlandProductListProvider _techScrapper =
      Get.find<TechlandProductListProvider>();

  Future<ProductPageModel> getProducts({
    required int page,
    required String category,
    required String site,
  }) {
    switch (site) {
      case ScrapperConstants.WEBSITE_RYANS:
        {
          print('$site repo');
          return _ryanScrapper.getProducts(
            page: page,
            category: category,
          );
        }
      case ScrapperConstants.WEBSITE_STARTECH:
        {
          print('$site repo');
          return _starScrapper.getProducts(
            page: page,
            category: category,
          );
        }
      case ScrapperConstants.WEBSITE_TECHLAND:
        {
          print('$site repo');
          return _techScrapper.getProducts(
            page: page,
            category: category,
          );
        }
      default:
        {
          print('$site repo');
          return _starScrapper.getProducts(
            page: page,
            category: category,
          );
        }
    }
  }
}
