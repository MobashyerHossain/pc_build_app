import 'package:get/get.dart';
import 'package:pc_build_app/app/data/providers/providers/ryans_scrapper_provider.dart';
import 'package:pc_build_app/app/data/providers/providers/startech_scrapper_provider.dart';
import 'package:pc_build_app/app/data/providers/providers/techland_scrapper_provider.dart';

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
    // Get.lazyPut<ScrappingRepository>(
    //   () => ScrappingRepository(),
    // );
    // Get.lazyPut<ScrappingController>(
    //   () => ScrappingController(),
    // );
  }
}
