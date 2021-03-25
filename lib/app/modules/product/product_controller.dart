import 'package:get/get.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'package:pc_build_app/app/data/repositories/scrapping_repository.dart';
import 'package:pc_build_app/app/global_controller/website_controller.dart';

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

  setCategory(String cat) {
    _category.value = cat;
  }

  setSite(String site) {
    _site.value = site;
  }
}
