import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'package:pc_build_app/app/data/providers/scrapping_provider_mixin.dart';
import 'package:uuid/uuid.dart';
import 'package:web_scraper/web_scraper.dart';

class TechlandScrapper with Scrapper {
  TechlandScrapper() {
    siteUrl = ScrapperConstants.TECHLAND_BASE_URL;
    categoryUrls = ScrapperConstants.TECHLAND_CATEGORY_LIST;
    localUrl = ScrapperConstants.TECHLAND_PRODUCT_INDEX_URL;
  }

  @override
  getProducts({required category, required page}) async {
    WebScraper webScraper = WebScraper(siteUrl);

    final nameList = [];
    final urlList = [];
    final thumbnailList = [];
    final priceList = [];
    List<ProductInfoModel> productList = [];

    var uuid = Uuid();

    try {
      var url = localUrl
          .replaceAll('[1]', '${categoryUrls[category]}')
          .replaceAll('[2]', '$page');

      if (await webScraper.loadWebPage(url)) {
        // Scrapping Title, Url
        webScraper.getElement(
          'div.product-layout > div.product-thumb > div.caption > div.name > a',
          ['href'],
        ).forEach((element) {
          final name = element['title'];
          final url = element['attributes']['href'];
          nameList.add(name);
          urlList.add(url);
        });

        // Scrapping Thumbnail
        webScraper.getElement(
          'div.product-layout > div.product-thumb > div.image > a > div > img',
          ['src'],
        ).forEach((element) {
          final thumbnail = element['attributes']['src'];
          thumbnailList.add(thumbnail);
        });

        // Scrapping Price
        webScraper.getElement(
          'div.product-layout > div.product-thumb > div.caption > div.price > span.price-tax',
          [],
        ).forEach((element) {
          final price = int.parse(
            element['title'].replaceAll(RegExp('[^0-9]'), ''),
          );
          priceList.add(price);
        });

        // Populating ProductInfo List
        for (var i = 0; i < nameList.length; i++) {
          productList.add(
            ProductInfoModel.fromMap(
              {
                'id': uuid.v5(
                  Uuid.NAMESPACE_URL,
                  '$siteUrl$localUrl/item$i',
                ),
                'title': nameList[i],
                'url': urlList[i].toString().replaceFirst(siteUrl, ''),
                'thumb': thumbnailList[i],
                'price': priceList[i],
              },
            ),
          );
        }

        // For Debugging
        // productList.forEach((element) {
        //   print(element);
        // });
        print('Scrapping Succesful');
      } else {
        print('Scrapping Unsuccesful');
        throw Exception('Api Connection Failed');
      }
    } catch (e) {
      print(e);
      // Get.to(
      //   () => ErrorPage(
      //     error: Exception('Check Your Internet Connection! $e'),
      //   ),
      // );
    }

    // Returning ProductInfo List
    return productList;
  }

  @override
  checkNextPage({required category, required page}) async {
    WebScraper webScraper = WebScraper(siteUrl);

    try {
      var url = localUrl
          .replaceAll('[1]', '${categoryUrls[category]}')
          .replaceAll('[2]', '$page');

      if (await webScraper.loadWebPage(url)) {
        var prices = webScraper.getElement(
          'div.product-layout > div.product-thumb > div.caption > div.price > span.price-tax',
          [],
        );

        if (prices.length > 0) {
          return Future<bool>.value(true);
        } else {
          return Future<bool>.value(false);
        }
      } else {
        return Future<bool>.value(false);
      }
    } catch (e) {
      return Future<bool>.value(false);
    }
  }
}
