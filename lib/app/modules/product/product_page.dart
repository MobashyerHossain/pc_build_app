import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/data/services/theme_services.dart';
import 'package:pc_build_app/app/global_widgets/bottom_nav_bar.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/product_item_card.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Get.isDarkMode ? Icons.nights_stay : Icons.wb_sunny),
          onPressed: ThemeService().switchTheme,
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        bottomNavigationBar: BottomNavBar(
          category: controller.getCategory(),
        ),
        body: WillPopScope(
          onWillPop: () async => true,
          child: SimpleGestureDetector(
            onHorizontalSwipe: controller.onVerticalSwipe,
            child: Container(
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
                  return FutureBuilder(
                    future: _.getProducts(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data != null) {
                        if (_.getLoading()) {
                          print('loading');
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          if (_.getHasError()) {
                            print('haserror');
                            return Center(
                              child: Text(
                                _.getError(),
                              ),
                            );
                          } else {
                            print('no issue');
                            return Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: GridView.builder(
                                padding: EdgeInsets.only(
                                  bottom: 70,
                                  top: 30,
                                ),
                                itemCount: snapshot.data.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 40,
                                  crossAxisCount:
                                      (MediaQuery.of(context).orientation ==
                                              Orientation.portrait)
                                          ? 2
                                          : 3,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return ProductItemCard(
                                    product: snapshot.data[index],
                                  );
                                },
                              ),
                            );
                          }
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
