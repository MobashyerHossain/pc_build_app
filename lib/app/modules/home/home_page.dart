import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/core/utils/constants/scrapper_constants.dart';
import 'package:pc_build_app/app/data/services/theme_services.dart';
import 'package:pc_build_app/app/global_widgets/bottom_nav_bar.dart';
import 'package:pc_build_app/app/modules/home/home_controller.dart';
import 'package:pc_build_app/app/modules/home/local_widgets/item_card.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';
import 'package:pc_build_app/app/routes/app_pages.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Get.isDarkMode ? Icons.nights_stay : Icons.wb_sunny),
          onPressed: ThemeService().switchTheme,
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        // bottomNavigationBar: BottomNavBar(),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: Get.isDarkMode
                  ? <Color>[
                      MyColorTheme.dark,
                      MyColorTheme.dark.shade200,
                    ]
                  : <Color>[
                      MyColorTheme.light.shade400,
                      MyColorTheme.light.shade100,
                    ],
              tileMode: TileMode.repeated,
            ),
          ),
          child: GetX<HomeController>(
            init: HomeController(),
            builder: (_) {
              final categories = _.getCategories();
              return Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print("at home_page ${categories[index].code}");
                        Get.find<ProductController>().fetchProducts(
                          1,
                          categories[index].code,
                          null,
                        );
                        Get.toNamed(
                          Routes.PRODUCT,
                        );
                      },
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: SizedBox(
                          width: Get.width / 2.5,
                          height: 170,
                          child: ItemCard(
                            category: categories[index],
                          ),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(index % 3 == 2 ? 2 : 1, 1),
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 0.0,
                ),
                // GridView.builder(
                //   padding: EdgeInsets.only(bottom: 70, top: 0),
                //   itemCount: categories.length,
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     childAspectRatio: 1,
                //     crossAxisSpacing: 20,
                //     mainAxisSpacing: 20,
                //     crossAxisCount: (MediaQuery.of(context).orientation ==
                //             Orientation.portrait)
                //         ? 2
                //         : 3,
                //   ),
                //   itemBuilder: (BuildContext context, int index) {
                //     return GestureDetector(
                //       onTap: () {
                //         print("at home_page ${categories[index].code}");
                //         Get.find<ProductController>().fetchProducts(
                //           1,
                //           categories[index].code,
                //           null,
                //         );
                //         Get.toNamed(
                //           Routes.PRODUCT,
                //         );
                //       },
                //       child: ItemCard(
                //         category: categories[index],
                //       ),
                //     );
                //   },
                // ),
              );
            },
          ),
        ),
      ),
    );
  }
}
