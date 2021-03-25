import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
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
          onPressed: () => Get.changeThemeMode(
            Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        bottomNavigationBar: BottomNavBar(),
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
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 70, top: 30),
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? 2
                        : 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.find<ProductController>()
                            .setCategory(categories[index].code);
                        Get.toNamed(
                          Routes.PRODUCT,
                        );
                      },
                      child: ItemCard(
                        category: categories[index],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
