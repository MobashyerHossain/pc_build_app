import 'package:get/get.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'package:pc_build_app/app/data/repositories/scrapping_repository.dart';
import 'package:pc_build_app/app/global_controller/website_controller.dart';
import 'package:pc_build_app/app/modules/splash/splash_controller.dart';
import 'package:pc_build_app/app/routes/app_pages.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class ProductController extends GetxController {
  final ScrappingRepository _scrapper = Get.find<ScrappingRepository>();
  RxInt _page = 1.obs;
  RxString _category = ''.obs;
  RxString _site = Get.find<WebsiteController>().getWebsite().code.obs;

  // ProductController(_products);

  Stream<List<ProductInfoModel>> getProducts() {
    print("getting products ....");
    print('$_site $_category $_page');
    return _scrapper.getProducts(
      page: _page.value,
      category: _category.value!,
      site: _site.value!,
    );
  }

  Future<bool> checkNextPage() {
    return _scrapper.checkNextPageAvailibility(
      page: _page.value + 1,
      category: _category.value!,
      site: _site.value!,
    );
  }

  setCategory(String cat) {
    _category.value = cat;
  }

  setSite(String site) {
    _site.value = site;
  }

  onHorizontalSwipe(SwipeDirection direction) {
    if (direction == SwipeDirection.left) {
      checkNextPage().then(
        (value) {
          if (value) {
            _page.value += 1;
            Get.offNamed(Routes.PRODUCT);
          } else {
            print('Current page ${_page.value} No Next Page');
          }
        },
      );
      print('page ${_page.value}');
    } else {
      if (_page.value > 1) {
        _page.value -= 1;
      } else {
        print('Current page ${_page.value} No Prev Page');
      }
    }
  }
}
