import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'package:pc_build_app/app/global_widgets/bottom_nav_bar.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/product_item_card.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';

class ProductPage extends GetView<ProductController> {
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
          child: GetX<ProductController>(
            init: ProductController(),
            builder: (_) {
              return StreamBuilder(
                stream: _.getProducts(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<ProductInfoModel> products = snapshot.data ??
                        [
                          ProductInfoModel.sampleModel(),
                        ];
                    return Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: GridView.builder(
                        padding: EdgeInsets.only(
                          bottom: 70,
                          top: 30,
                        ),
                        itemCount: products.length,
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
                          return ProductItemCard(
                            product: products[index],
                          );
                        },
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
