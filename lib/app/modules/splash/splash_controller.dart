import 'package:get/get.dart';
import 'package:pc_build_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _init();
  }

  void _init() async {
    Future.delayed(
      Duration(
        seconds: 4,
      ),
    ).whenComplete(
      () => Get.offNamed(Routes.HOME),
    );
  }
}
