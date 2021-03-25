import 'package:get/get.dart';
import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/models/basic_product_info_model.dart';
import 'package:pc_build_app/app/data/providers/providers/ryans_scrapper_provider.dart';
import 'package:pc_build_app/app/data/providers/providers/startech_scrapper_provider.dart';
import 'package:pc_build_app/app/data/providers/providers/techland_scrapper_provider.dart';

class ScrappingRepository {
  final RyansScrapper _ryanScrapper = Get.find<RyansScrapper>();
  final StartechScrapper _starScrapper = Get.find<StartechScrapper>();
  final TechlandScrapper _techScrapper = Get.find<TechlandScrapper>();

  Stream<List<BasicProductInfoModel>> getProductInfoList({
    required int page,
    required String category,
    required String site,
  }) {
    switch (site) {
      case ScrapperConstants.WEBSITE_RYANS:
        {
          print(site);
          return _ryanScrapper
              .getProductInfoList(
                page: page,
                category: category,
              )
              .asStream();
        }
      case ScrapperConstants.WEBSITE_STARTECH:
        {
          print(site);
          return _starScrapper
              .getProductInfoList(
                page: page,
                category: category,
              )
              .asStream();
        }
      case ScrapperConstants.WEBSITE_TECHLAND:
        {
          print(site);
          return _techScrapper
              .getProductInfoList(
                page: page,
                category: category,
              )
              .asStream();
        }
      default:
        {
          print(site);
          return _starScrapper
              .getProductInfoList(
                page: page,
                category: category,
              )
              .asStream();
        }
    }
  }

  Future<bool> checkNextPageAvailibility({
    required int page,
    required String category,
    required String site,
  }) {
    // ignore: unrelated_type_equality_checks
    switch (site) {
      case ScrapperConstants.WEBSITE_RYANS:
        {
          return _ryanScrapper.checkNextPage(
            page: page,
            category: category,
          );
        }
      case ScrapperConstants.WEBSITE_STARTECH:
        {
          return _starScrapper.checkNextPage(
            page: page,
            category: category,
          );
        }
      case ScrapperConstants.WEBSITE_TECHLAND:
        {
          return _starScrapper.checkNextPage(
            page: page,
            category: category,
          );
        }
      default:
        {
          return _starScrapper.checkNextPage(
            page: page,
            category: category,
          );
        }
    }
  }
}