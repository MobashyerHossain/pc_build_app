import 'package:get/get.dart';
import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/models/category_model.dart';

class HomeController extends GetxController {
  final _site = 1.obs;

  setSite(value) => this._site.value = value;
  getSite() => this._site.value;

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
