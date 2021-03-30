import 'package:get/get.dart';
import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'package:pc_build_app/app/data/providers/product_search/product_search_provider_mixin.dart';
import 'package:pc_build_app/app/routes/app_pages.dart';
import 'package:uuid/uuid.dart';
import 'package:web_scraper/web_scraper.dart';

class TechlandProductSearchProvider with ProductSearchProvider {
  TechlandProductSearchProvider() {
    siteUrl = ScrapperConstants.TECHLAND_BASE_URL;
    searchUrl = ScrapperConstants.TECHLAND_PRODUCT_SEARCH_URL;
  }

  @override
  getSearchResult({
    required searchKey,
  }) async {
    WebScraper webScraper = WebScraper(siteUrl);

    final titleList = [];
    final urlList = [];
    final thumbnailList = [];
    final priceList = [];
    final labelList = [];
    List<ProductInfoModel> productList = [];

    var uuid = Uuid();

    try {
      var url = '$searchUrl$searchKey';

      if (await webScraper.loadWebPage(url)) {
        // Scrapping Title, Url
        webScraper.getElement(
          'div.product-content-info > a.product-title-grid',
          ['href'],
        ).forEach(
          (element) {
            final title = element['title'];
            final url = element['attributes']['href'];
            titleList.add(title);
            urlList.add(url);
          },
        );

        // Scrapping Thumbnail
        webScraper.getElement(
          'div.product-thumb > a > img',
          ['src'],
        ).forEach(
          (element) {
            final thumbnail = element['attributes']['src'];
            thumbnailList.add(thumbnail);
          },
        );

        // Scrapping Price
        webScraper.getElement(
          'div.price-label > div.special-price > span',
          [],
        ).forEach(
          (element) {
            final price = int.parse(
              element['title'].replaceAll(RegExp('[^0-9]'), ''),
            );
            priceList.add(price);
          },
        );

        // // Product Label
        webScraper.getElement(
          'div.product-box > div.product-thumb',
          [],
        ).forEach(
          (element) {
            final temp = element.toString().toLowerCase();
            var label = '';
            if (temp.contains('out of stock')) {
              label = 'Out of Stock';
            } else if (temp.contains('up coming')) {
              label = 'Upcoming';
            } else if (temp.contains('call for price')) {
              label = 'Call for Price';
            } else {
              label = '';
            }

            labelList.add(label);
          },
        );

        // Populating Brand Model
        var brandNames = [];
        webScraper.getElement(
          'div.default-brand-filters > span > button',
          [],
        ).forEach(
          (element) {
            brandNames.add(
              element['title'].toString().split(' ')[0],
            );
          },
        );

        // checking previous page
        bool prevCheck = !webScraper.getElement(
          'div.pages > ol > li',
          ['aria-label'],
        ).any((element) => element['attributes']['aria-label'] == '« Previous');

        // checking next page
        bool nextCheck = !webScraper.getElement(
          'div.pages > ol > li',
          ['aria-label'],
        ).any((element) => element['attributes']['aria-label'] == 'Next »');

        // Populating ProductInfo List
        for (var i = 0; i < titleList.length; i++) {
          productList.add(
            ProductInfoModel(
              id: uuid.v5(
                Uuid.NAMESPACE_URL,
                '$siteUrl$searchUrl/item$i',
              ),
              title: titleList[i].trim(),
              url: urlList[i].toString().replaceFirst(siteUrl, ''),
              thumb: thumbnailList[i],
              price: priceList[i],
              spacialNote: labelList[i].trim(),
            ),
          );
        }

        // For Debugging
        // productList.forEach((element) {
        //   print(element);
        // });
        // print(productPage);
        print('Scrapping Succesful');
      } else {
        print('Scrapping Unsuccesful');
        throw Exception('Api Connection Failed');
      }
    } catch (e) {
      print(e);
      Get.offNamed(
        Routes.ERROR,
        parameters: {
          'error': e.toString(),
        },
      );
    }

    // Returning ProductInfo List
    return productList;
  }
}
