import 'package:get/get.dart';
import 'package:pc_build_app/app/modules/home/home_binding.dart';
import 'package:pc_build_app/app/modules/home/home_page.dart';
import 'package:pc_build_app/app/modules/splash/spash_page.dart';
import 'package:pc_build_app/app/modules/splash/splash_binding.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.DETAILS,
    //   page: () => DetailsPage(),
    //   binding: DetailsBinding(),
    // ),
  ];
}
