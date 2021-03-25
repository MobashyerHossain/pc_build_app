import 'package:get/get.dart';
import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/models/category_model.dart';
import 'package:pc_build_app/app/data/models/website_model.dart';

class HomeController extends GetxController {
  List<WebsiteModel> getWebSites() {
    List<WebsiteModel> websites = [];

    ScrapperConstants.WEBSITE_LIST.forEach(
      (key, value) {
        websites.add(
          WebsiteModel(
            name: value,
            logo: 'assets/images/site_logo/$key.png',
            categoryList: ScrapperConstants.CATEGORY_LIST[key]!,
          ),
        );
      },
    );
    return websites.obs;
  }

  List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    ScrapperConstants.CATEGORIES.forEach((element) {
      categories.add(
        CategoryModel(
          code: element,
          name: element.replaceAll('_', ' ').capitalize.toString(),
          thumb: 'assets/images/thumbnails/$element.png',
        ),
      );
    });

    Comparator<CategoryModel> nameComparator =
        (a, b) => a.name.compareTo(b.name);
    categories.sort(nameComparator);

    return categories.obs;
  }
}
