// import 'package:get/get.dart';
// import 'package:pc_build_app/app/data/repositories/scrapping_repository.dart';
// import 'package:pc_build_app/app/global_controller/website_controller.dart';
// import 'package:pc_build_app/app/routes/app_pages.dart';
// import 'package:simple_gesture_detector/simple_gesture_detector.dart';

// class ProductController extends GetxController {
//   final ScrappingRepository _scrapper = Get.find<ScrappingRepository>();

//   RxBool _loading = true.obs;
//   RxBool _hasError = false.obs;
//   RxString _error = 'Error'.obs;

//   RxInt _page = 1.obs;
//   RxString _category = ''.obs;
//   RxString _site = Get.find<WebsiteController>().getWebsite().code.obs;

// @override
// onInit() {
//   super.onInit();
//   print('ProductController initiated');
//   if (Get.arguments != null) {
//     _category.value = Get.arguments;
//     print(_category.value);
//   }

//   // fetchData();
// }

//   @override
//   onClose() {
//     print('ProductController closed');
//   }

//   getProducts() {
//     return fetchData();
//   }

//   bool isLoading() {
//     return _loading.value!;
//   }

//   String getError() {
//     return _error.value!;
//   }

//   bool hasError() {
//     return _hasError.value!;
//   }

//   fetchData() {
// print('data fetched');
// try {
//   _loading.value = true;
//   _scrapper.getProducts(
//     page: _page.value,
//     category: _category.value!,
//     site: _site.value!,
//   );
//   _hasError.value = false;
// } catch (e) {
//   _hasError.value = true;
//   _error.value = e.toString();
// } finally {
//   _loading.toggle();
// }
//   }

//   // Stream<List<ProductInfoModel>> getProducts() {
//   //   // if (_products.length == 0) {
//   //   //   _scrapper
//   //   //       .getProducts(
//   //   // page: _page.value,
//   //   // category: _category.value!,
//   //   // site: _site.value!,
//   //   //       ).pipe(streamConsumer)
//   //   //       .forEach((element) {_products.add(element)});
//   //   // }
//   //   print("getting products ....");
//   //   print('$_site $_category $_page');
//   //   return _scrapper.getProducts(
//   //     page: _page.value,
//   //     category: _category.value!,
//   //     site: _site.value!,
//   //   );
//   // }

// Future<bool> checkNextPage() {
//   return _scrapper.checkNextPageAvailibility(
//     page: _page.value + 1,
//     category: _category.value!,
//     site: _site.value!,
//   );
// }

//   setPage(int page) {
//     _page.value = page;
//     fetchData();
//   }

//   setCategory(String cat) {
//     _category.value = cat;
//     fetchData();
//   }

//   setSite(String site) {
//     _site.value = site;
//   }

// onHorizontalSwipe(SwipeDirection direction) {
//   if (direction == SwipeDirection.left) {
//     checkNextPage().then(
//       (value) {
//         if (value) {
//           _page.value += 1;
//           Get.offNamed(Routes.PRODUCT);
//         } else {
//           print('Current page ${_page.value} No Next Page');
//         }
//       },
//     );
//     print('page ${_page.value}');
//   } else {
//     if (_page.value > 1) {
//       _page.value -= 1;
//     } else {
//       print('Current page ${_page.value} No Prev Page');
//     }
//   }
// }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'package:pc_build_app/app/data/repositories/scrapping_repository.dart';
import 'package:pc_build_app/app/routes/app_pages.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class ProductController extends GetxController {
  final ScrappingRepository _scrapper = Get.find<ScrappingRepository>();
  // site >> category >> page >> products

  final _site = ''.obs;
  final _category = ''.obs;
  final _page = 1.obs;
  final _products = Future.value(
    [
      ProductInfoModel.sampleModel(),
    ],
  ).obs;

  final _loading = true.obs;
  final _hasError = false.obs;
  final _error = ''.obs;

  setPage(value) => this._page.value = value;
  getPage() => this._page.value;

  setCategory(value) => this._category.value = value;
  getCategory() => this._category.value;

  setSite(value) => this._site.value = value;
  getSite() => this._site.value;

  setProducts(value) => this._products.value = value;
  getProducts() => this._products.value;

  getLoading() => this._loading.value;
  setLoading(value) => this._loading.value = value;
  getHasError() => this._hasError.value;
  setHasError(value) => this._hasError.value = value;
  getError() => this._error.value;
  setError(value) => this._error.value = value;

  // void init() {
  //   setSite(Get.arguments['site']);
  //   setCategory(Get.arguments['category']);
  //   setPage(Get.arguments['page']);

  //   fetchProducts();
  //   update();
  // }

  // @override
  // onReady() {
  //   super.onReady();
  //   print('ProductController initiated');
  //   print(Get.arguments);
  //   setCategory(Get.arguments);

  //   print('fetching initial data');
  //   fetchProducts();
  // }

  fetchProducts(
    int? page,
    String? category,
    String? site,
  ) {
    print('data fetched');
    try {
      setLoading(true);

      if (page != null) setPage(page);
      if (category != null) setCategory(category);
      if (site != null) setSite(site);

      this._products.value = _scrapper.getProducts(
        page: getPage(),
        category: getCategory(),
        site: getSite(),
      );
      setHasError(false);
    } catch (e) {
      setHasError(true);
      setError(e);
    } finally {
      setLoading(false);
      _snackbarForAll();
    }
  }

  Future<bool> checkNextPage() {
    return _scrapper.checkNextPageAvailibility(
      page: getPage() + 1,
      category: getCategory(),
      site: getSite(),
    );
  }

  onVerticalSwipe(SwipeDirection direction) {
    if (direction == SwipeDirection.left) {
      checkNextPage().then(
        (value) {
          if (value) {
            setPage(getPage() + 1);
            Get.toNamed(
              Routes.PRODUCT,
            );
            fetchProducts(null, null, null);
          } else {
            _snackbar('Next');
            print('Current page ${_page.value} No Next Page');
          }
        },
      );
      print('page ${_page.value}');
    } else {
      if (_page.value > 1) {
        setPage(getPage() - 1);
        Get.toNamed(
          Routes.PRODUCT,
        );
        fetchProducts(null, null, null);
      } else {
        _snackbar('Previous');
        print('Current page ${_page.value} No Prev Page');
      }
    }
  }

  _snackbar(String dir) {
    Get.snackbar(
      '',
      '',
      backgroundColor: Colors.grey.withOpacity(.5),
      titleText: Text(
        'Page ${getPage()}',
        textScaleFactor: 2,
        style: TextStyle(
          color: Colors.grey.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        'No $dir Page Available',
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.grey.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
      showProgressIndicator: true,
      duration: Duration(
        seconds: 2,
      ),
    );
  }

  _snackbarForAll() {
    var title;
    var message;
    if (getPage() == 1) {
      title =
          'Welcome To ${ScrapperConstants.WEBSITE_LIST[getSite().toString()]}';
      message =
          '${getCategory().toString().replaceAll('_', ' ').capitalize}\nPage ${getPage()}';
    } else {
      title = '${getCategory().toString().replaceAll('_', ' ').capitalize}';
      message =
          'Page ${getPage()}\n${ScrapperConstants.WEBSITE_LIST[getSite().toString()]}';
    }

    Get.snackbar(
      '',
      '',
      backgroundColor: Colors.grey.withOpacity(.5),
      titleText: Text(
        title,
        textScaleFactor: 2,
        style: TextStyle(
          color: Colors.grey.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.grey.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
      showProgressIndicator: true,
      duration: Duration(
        seconds: 2,
      ),
    );
  }
}
