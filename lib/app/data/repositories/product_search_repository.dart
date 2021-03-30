import 'package:get/get.dart';
import 'package:pc_build_app/app/data/providers/product_search/ryans_product_search_provider.dart';
import 'package:pc_build_app/app/data/providers/product_search/startech_product_search_provider.dart';
import 'package:pc_build_app/app/data/providers/product_search/techland_product_search_provider.dart';

class ProductSearchRepository {
  final RyansProductSearchProvider _ryanScrapper =
      Get.find<RyansProductSearchProvider>();
  final StartechProductSearchProvider _starScrapper =
      Get.find<StartechProductSearchProvider>();
  final TechlandProductSearchProvider _techScrapper =
      Get.find<TechlandProductSearchProvider>();
}
