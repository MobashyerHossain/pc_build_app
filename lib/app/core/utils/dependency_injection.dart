import 'package:get/get.dart';
import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/providers/ryans_scrapper_provider.dart';
import 'package:pc_build_app/app/data/providers/startech_scrapper_provider.dart';
import 'package:pc_build_app/app/data/providers/techland_scrapper_provider.dart';
import 'package:pc_build_app/app/data/repositories/scrapping_repository.dart';
import 'package:pc_build_app/app/global_controller/website_controller.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<RyansScrapper>(
      () => RyansScrapper(),
    );
    Get.lazyPut<StartechScrapper>(
      () => StartechScrapper(),
    );
    Get.lazyPut<TechlandScrapper>(
      () => TechlandScrapper(),
    );
    Get.lazyPut<ScrappingRepository>(
      () => ScrappingRepository(),
    );
    Get.lazyPut<WebsiteController>(
      () => WebsiteController(
        ScrapperConstants.WEBSITE_STARTECH,
      ),
    );
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
    // Get.lazyPut<ScrappingController>(
    //   () => ScrappingController(),
    // );
  }
}
