import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/models/brand_model.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'package:pc_build_app/app/data/models/product_page_model.dart';
import 'package:pc_build_app/app/data/providers/scrapping_provider_mixin.dart';
import 'package:uuid/uuid.dart';
import 'package:web_scraper/web_scraper.dart';

class RyansScrapper with Scrapper {
  RyansScrapper() {
    siteUrl = ScrapperConstants.RYANS_BASE_URL;
    categoryUrls = ScrapperConstants.RYANS_CATEGORY_LIST;
    localUrl = ScrapperConstants.RYANS_PRODUCT_INDEX_URL;
  }

  @override
  getProducts({required category, required page}) async {
    WebScraper webScraper = WebScraper(siteUrl);

    final nameList = [];
    final urlList = [];
    final thumbnailList = [];
    final priceList = [];
    List<ProductInfoModel> productList = [];
    List<BrandModel> brandList = [];
    ProductPageModel productPage = ProductPageModel.sampleModel();

    var uuid = Uuid();

    try {
      var url = localUrl
          .replaceAll('[1]', '${categoryUrls[category]}')
          .replaceAll('[2]', '$page');

      if (await webScraper.loadWebPage(url)) {
        // Scrapping Title, Url
        webScraper.getElement(
          'div.product-content-info > a.product-title-grid',
          ['href'],
        ).forEach(
          (element) {
            final name = element['title'];
            final url = element['attributes']['href'];
            nameList.add(name);
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

        webScraper
            .getElement(
              'div.default-brand-filters > span > input',
              ['value'],
            )
            .asMap()
            .forEach(
              (index, element) {
                var brandUrl = '$url&query=${element['attributes']['value']}'
                    .replaceAll('@#@', '%40%23%40%7C');
                brandList.add(
                  BrandModel(
                    name: brandNames[index],
                    url: brandUrl,
                  ),
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

        productPage = ProductPageModel(
          page: page,
          nextPageAvailable: nextCheck,
          previousPageAvailable: prevCheck,
          category: category,
          website: 'ryans',
          productList: productList,
          brandList: brandList,
        );

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
    }

    // Returning ProductInfo List
    return productPage;
  }
}
