import 'package:get/get.dart';
import 'package:pc_build_app/app/modules/error/error_page.dart';
import 'package:pc_build_app/app/modules/home/home_binding.dart';
import 'package:pc_build_app/app/modules/home/home_page.dart';
import 'package:pc_build_app/app/modules/product/product_binding.dart';
import 'package:pc_build_app/app/modules/product/product_page.dart';
import 'package:pc_build_app/app/modules/splash/spash_page.dart';
import 'package:pc_build_app/app/modules/splash/splash_binding.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductPage(),
      binding: ProductBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.ERROR,
      page: () => ErrorPage(
        error: Get.parameters['error'],
      ),
      transition: Transition.zoom,
    ),
  ];
}
