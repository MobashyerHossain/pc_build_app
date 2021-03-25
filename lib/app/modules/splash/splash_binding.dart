import 'package:get/get.dart';
import 'package:pc_build_app/app/modules/splash/splash_controller.dart';
// import 'package:http/http.dart' as http;

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
