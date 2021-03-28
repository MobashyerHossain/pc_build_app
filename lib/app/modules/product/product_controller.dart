import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/models/brand_model.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'package:pc_build_app/app/data/models/product_page_model.dart';
import 'package:pc_build_app/app/data/models/website_model.dart';
import 'package:pc_build_app/app/data/repositories/scrapping_repository.dart';
import 'package:pc_build_app/app/data/services/site_change_service.dart';
import 'package:pc_build_app/app/global_controller/website_controller.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class ProductController extends GetxController {
  final ScrappingRepository _scrapper = Get.find<ScrappingRepository>();
  final _productPage = ProductPageModel.sampleModel().obs;
  // site >> category >> page >> products

  final _site = ''.obs;
  final _category = ''.obs;
  final _page = 1.obs;
  final _products = List<ProductInfoModel>.empty().obs;
  final _brands = List<BrandModel>.empty().obs;

  final _loading = true.obs;
  final _hasError = false.obs;
  final _error = ''.obs;

  final _nextPageAvailable = false.obs;
  final _prevPageAvailable = false.obs;

  setPage(value) => this._page.value = value;
  getPage() => this._page.value;

  setCategory(value) => this._category.value = value;
  getCategory() => this._category.value;

  setSite(value) => this._site.value = value;
  getSite() => this._site.value;

  setProductPage(value) => this._productPage.value = value;
  getProductPage() => this._productPage;

  setProducts(value) => this._products.value = value;
  getProducts() => this._products;

  setBrands(value) => this._brands.value = value;
  getBrands() => this._brands;

  getLoading() => this._loading.value;
  setLoading(value) => this._loading.value = value;
  getHasError() => this._hasError.value;
  setHasError(value) => this._hasError.value = value;
  getError() => this._error.value;
  setError(value) => this._error.value = value;

  getNextPageAvailable() => this._nextPageAvailable.value;
  setNextPageAvailable(value) => this._nextPageAvailable.value = value;

  getPrevPageAvailable() => this._prevPageAvailable.value;
  setPrevPageAvailable(value) => this._prevPageAvailable.value = value;

  // ProductController() {
  //   setSite(ScrapperConstants.WEBSITE_LIST[BottomBarService().index]);
  //   print('lalala');
  // }

  @override
  onReady() {
    super.onReady();
    print('ProductController Ready');
    var _tempSite = ScrapperConstants.WEBSITE_LIST.entries
        .elementAt(SiteChangeService().index)
        .key;
    setSite(_tempSite);
    print('Current Site : $_tempSite / ${this.getSite()}');
  }

  @override
  onClose() {
    super.onClose();
    print('closed');
  }

  fetchProducts(
    int? temPage,
    String? temCategory,
    String? temSite,
  ) {
    if (temPage != null) setPage(temPage);
    if (temCategory != null) setCategory(temCategory);
    if (temSite != null) setSite(temSite);
    setNextPageAvailable(false);
    setPrevPageAvailable(false);

    print(
      'Data Fetching for -->\n${this.getSite()} - ${this.getCategory()} - ${this.getPage()}',
    );
    print('Start Fetching');
    try {
      setLoading(true);

      _scrapper
          .getProducts(
        page: getPage(),
        category: getCategory(),
        site: getSite(),
      )
          .then(
        (value) {
          setProductPage(value);

          setSite(value.website);
          setCategory(value.category);
          setPage(value.page);
          setProducts(value.productList);
          setBrands(value.brandList);
          setNextPageAvailable(value.nextPageAvailable);
          setPrevPageAvailable(value.previousPageAvailable);
          setLoading(false);
          Get.appUpdate();

          print('End Fetching');
        },
      );

      // setProducts();
      setHasError(false);
    } catch (e) {
      setHasError(true);
      setError(e.toString());
    } finally {}
  }

  pageChange(String dir) {
    if (dir == 'left') {
      if (_page.value > 1) {
        fetchProducts(_page.value - 1, null, null);
      } else {
        _snackbar('Previous');
        print('Current page ${_page.value} No Prev Page');
      }
    } else {
      if (_nextPageAvailable.value!) {
        fetchProducts(_page.value + 1, null, null);
      } else {
        _snackbar('Next');
        print('Current page ${_page.value} No Next Page');
      }
      print('page ${_page.value}');
    }
  }

  onVerticalSwipe(SwipeDirection direction) {
    if (direction == SwipeDirection.left) {
      pageChange('right');
    } else {
      pageChange('left');
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
          color: Get.isDarkMode ? MyColorTheme.light : MyColorTheme.dark,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        'No $dir Page Available',
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Get.isDarkMode ? MyColorTheme.light : MyColorTheme.dark,
          fontWeight: FontWeight.bold,
        ),
      ),
      showProgressIndicator: true,
      duration: Duration(
        seconds: 2,
      ),
    );
  }

  snackbarForAll() {
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
      backgroundColor: Get.isDarkMode
          ? MyColorTheme.dark.withOpacity(.5)
          : MyColorTheme.light.withOpacity(.5),
      titleText: Text(
        title,
        textScaleFactor: 2,
        style: TextStyle(
          color: Get.isDarkMode ? MyColorTheme.light : MyColorTheme.dark,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Get.isDarkMode ? MyColorTheme.light : MyColorTheme.dark,
          fontWeight: FontWeight.bold,
        ),
      ),
      showProgressIndicator: true,
      duration: Duration(
        seconds: 2,
      ),
    );
  }

  List<WebsiteModel> getWebsites() {
    return Get.find<WebsiteController>().getWebSites();
  }
}
