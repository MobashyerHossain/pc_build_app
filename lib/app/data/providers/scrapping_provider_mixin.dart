import 'package:pc_build_app/app/data/models/product_info_model.dart';

mixin Scrapper {
  String siteUrl = '';
  Map<String, String> categoryUrls = {};
  String localUrl = '';

  Future<List<ProductInfoModel>> getProducts({
    required category,
    required page,
  }) async {
    return [];
  }

  Future<bool> checkNextPage({
    required category,
    required page,
  }) async {
    return Future.value(false);
  }
}

// abstract class Scrapper {
//   Future<List<BasicProductModel>> getBasicProductData({
//     required page,
//     required category,
//   }) async {
//     final webScraper = WebScraper('x.com');
//     List<Map<String, dynamic>> nameAndUrls = [];
//     List<Map<String, dynamic>> thumbnails = [];
//     List<Map<String, dynamic>> prices = [];
//     List<BasicProductModel> products = [];
//     var uuid = Uuid();

//     try {
//       if (await webScraper.loadWebPage('/abc')) {
//         for (var i = 0; i < 20; i++) {
//           products.add(
//             BasicProductModel(
//               id: uuid.v5(Uuid.NAMESPACE_URL, 'x'),
//               title: nameAndUrls[i]['name'],
//               url: nameAndUrls[i]['url'],
//               price: int.parse(prices[i]['price']),
//               thumb: thumbnails[i]['thumb'],
//             ),
//           );
//         }
//         // Scrapping data
//       }
//     } catch (e) {
//       print(e);
//     }
//     return products;
//   }

//   Future<List<BasicProductModel>> getDetailProductData({
//     required String productUrl,
//   }) async {
//     return [
//       BasicProductModel.sampleModel(),
//     ];
//   }

//   Future<bool> checkNextPageAvailibility({
//     required page,
//     required category,
//   }) {
//     return Future.value(false);
//   }
// }
