import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/global_widgets/floating_button.dart';
import 'package:pc_build_app/app/global_widgets/section_title.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/page_change_indicator.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/product_item_card.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class ProductPage extends GetView<ProductController> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingButton(
          fabKey: fabKey,
        ),
        body: Stack(
          children: [
            SimpleGestureDetector(
              onHorizontalSwipe: controller.onVerticalSwipe,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: Get.isDarkMode
                        ? <Color>[
                            Colors.grey.shade900,
                            Colors.grey.shade700,
                          ]
                        : <Color>[
                            Colors.grey.shade100,
                            Colors.grey.shade500,
                          ],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Container(
                  child: GetX<ProductController>(
                    init: ProductController(),
                    builder: (_) {
                      // return FutureBuilder(
                      //   future: _.getProducts(),
                      //   builder:
                      //       (BuildContext context, AsyncSnapshot snapshot) {
                      //     if (snapshot.data != null) {
                      //       print(snapshot.data.length);
                      //       if (_.getLoading()) {
                      //         print('loading');
                      //         return Center(
                      //           child: CircularProgressIndicator(),
                      //         );
                      //       } else {
                      //         print('Loading Complete');
                      //         if (_.getHasError()) {
                      //           print('haserror');
                      //           return Center(
                      //             child: Text(
                      //               _.getError(),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //           );
                      //         } else {
                      //           print('No Error Found');
                      //           ScaffoldMessenger.of(context).clearSnackBars();
                      // return Container(
                      //   padding: EdgeInsets.only(
                      //     left: 10,
                      //     right: 10,
                      //   ),
                      //   child: StaggeredGridView.countBuilder(
                      //     padding: EdgeInsets.only(
                      //       bottom: 70,
                      //       top: 40,
                      //     ),
                      //     crossAxisCount: 2,
                      //     itemCount: snapshot.data.length,
                      //     itemBuilder:
                      //         (BuildContext context, int index) {
                      //       return GestureDetector(
                      //         onTap: () {},
                      //         child: Center(
                      //           child: FittedBox(
                      //             fit: BoxFit.fitWidth,
                      //             child: SizedBox(
                      //               width: Get.width / 2.2,
                      //               height: 160,
                      //               child: ProductItemCard(
                      //                 product: snapshot.data[index],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //     staggeredTileBuilder: (int index) =>
                      //         new StaggeredTile.count(
                      //             index % 3 == 2 ? 2 : 1, 1),
                      //     mainAxisSpacing: 30.0,
                      //     crossAxisSpacing: 0.0,
                      //   ),
                      // );
                      //         }
                      //       }
                      //     } else {
                      //       return Center(
                      //         child: CircularProgressIndicator(),
                      //       );
                      //     }
                      //   },
                      // );
                      final products = _.getProducts();
                      if (!_.getLoading()) {
                        return Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: StaggeredGridView.countBuilder(
                            padding: EdgeInsets.only(
                              bottom: 70,
                              top: 40,
                            ),
                            crossAxisCount: 2,
                            itemCount: products.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: SizedBox(
                                      width: Get.width / 2.2,
                                      height: 160,
                                      child: ProductItemCard(
                                        product: products[index],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            staggeredTileBuilder: (int index) =>
                                new StaggeredTile.count(
                                    index % 3 == 0 ? 2 : 1, 1),
                            mainAxisSpacing: 30.0,
                            crossAxisSpacing: 0.0,
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Get.isDarkMode
                                ? MyColorTheme.dark
                                : MyColorTheme.light,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: Get.height / 1.6,
              right: -23,
              child: Obx(
                () {
                  final c = Get.find<ProductController>();
                  print(c.getNextPageAvailable());

                  if (c.getNextPageAvailable()) {
                    return PageChangeIndicator(
                      icon: Icons.keyboard_arrow_right,
                      pageChangeDirection: 'right',
                      controller: controller,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Positioned(
              top: Get.height / 1.6,
              left: -23,
              child: Obx(
                () {
                  final c = Get.find<ProductController>();
                  print(c.getNextPageAvailable());

                  if (c.getPrevPageAvailable()) {
                    return PageChangeIndicator(
                      icon: Icons.keyboard_arrow_left,
                      pageChangeDirection: 'left',
                      controller: controller,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Positioned(
              top: 5,
              width: Get.width,
              child: GetX<ProductController>(
                init: ProductController(),
                builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionTitle(
                        title: _
                            .getCategory()
                            .toString()
                            .replaceAll('_', ' ')
                            .toUpperCase(),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(8),
                        textSize: 15,
                      ),
                      SectionTitle(
                        title: "Page ${_.getPage()}",
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(8),
                        textSize: 15,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
