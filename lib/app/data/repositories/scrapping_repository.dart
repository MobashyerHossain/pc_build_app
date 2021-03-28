import 'package:get/get.dart';
import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/models/product_page_model.dart';
import 'package:pc_build_app/app/data/providers/ryans_scrapper_provider.dart';
import 'package:pc_build_app/app/data/providers/startech_scrapper_provider.dart';
import 'package:pc_build_app/app/data/providers/techland_scrapper_provider.dart';

class ScrappingRepository {
  final RyansScrapper _ryanScrapper = Get.find<RyansScrapper>();
  final StartechScrapper _starScrapper = Get.find<StartechScrapper>();
  final TechlandScrapper _techScrapper = Get.find<TechlandScrapper>();

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
