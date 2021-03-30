import 'package:get/get.dart';
import 'package:pc_build_app/app/data/providers/product_list/ryans_product_list_provider.dart';
import 'package:pc_build_app/app/data/providers/product_list/startech_product_list_provider.dart';
import 'package:pc_build_app/app/data/providers/product_list/techland_product_list_provider.dart';
import 'package:pc_build_app/app/data/repositories/products_repository.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';
import 'package:pc_build_app/app/modules/splash/splash_controller.dart';

class ProductBinding implements Bindings {
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
    Get.lazyPut<ProductsRepository>(
      () => ProductsRepository(),
    );
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
