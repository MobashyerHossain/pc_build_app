import 'package:get/get.dart';
import 'package:pc_build_app/app/data/providers/product_list/ryans_product_list_provider.dart';
import 'package:pc_build_app/app/data/providers/product_list/startech_product_list_provider.dart';
import 'package:pc_build_app/app/data/providers/product_list/techland_product_list_provider.dart';
import 'package:pc_build_app/app/data/repositories/product_detail_repository.dart';
import 'package:pc_build_app/app/modules/details/product_detail_controller.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartechProductListProvider>(
      () => StartechProductListProvider(),
    );
    Get.lazyPut<RyansProductListProvider>(
      () => RyansProductListProvider(),
    );
    Get.lazyPut<TechlandProductListProvider>(
      () => TechlandProductListProvider(),
    );
    Get.lazyPut<ProductDetailController>(
      () => ProductDetailController(),
    );
    Get.lazyPut<ProductDetailRepository>(
      () => ProductDetailRepository(),
    );
    Get.lazyPut<ProductDetailController>(
      () => ProductDetailController(),
    );
  }
}
