import 'package:get/get.dart';
import 'package:pc_build_app/app/data/providers/ryans_scrapper_provider.dart';
import 'package:pc_build_app/app/data/providers/startech_scrapper_provider.dart';
import 'package:pc_build_app/app/data/providers/techland_scrapper_provider.dart';
import 'package:pc_build_app/app/data/repositories/scrapping_repository.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';
import 'package:pc_build_app/app/modules/splash/splash_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartechScrapper>(
      () => StartechScrapper(),
    );
    Get.lazyPut<RyansScrapper>(
      () => RyansScrapper(),
    );
    Get.lazyPut<TechlandScrapper>(
      () => TechlandScrapper(),
    );
    Get.lazyPut<ScrappingRepository>(
      () => ScrappingRepository(),
    );
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
