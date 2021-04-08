import 'package:animate_do/animate_do.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/global_widgets/floating_button.dart';
import 'package:pc_build_app/app/global_widgets/gradient_container.dart';
import 'package:pc_build_app/app/global_widgets/menu_side_bar.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/page_changer.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/product_item_card.dart';
import 'package:pc_build_app/app/global_widgets/search_box.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/top_bar.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';
import 'package:pc_build_app/app/modules/search/search_controller.dart';
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
        drawer: MenuSideBar(),
        body: GradientContainer(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SimpleGestureDetector(
                onHorizontalSwipe: controller.onVerticalSwipe,
                child: GetX<ProductController>(
                  init: ProductController(),
                  builder: (_) {
                    final products = _.getProducts();
                    return Stack(
                      children: [
                        // Product List
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: StaggeredGridView.countBuilder(
                            physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics(),
                            ),
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(
                              bottom: 120,
                              top: 120,
                            ),
                            crossAxisCount: 2,
                            itemCount: products.length,
                            staggeredTileBuilder: (int index) =>
                                new StaggeredTile.count(
                              index % 3 == 0 ? 2 : 1,
                              1,
                            ),
                            mainAxisSpacing: 0.0,
                            crossAxisSpacing: 0.0,
                            itemBuilder: (BuildContext context, int index) {
                              // Card
                              return ProductItemCard(
                                product: products[index],
                              );
                            },
                          ),
                        ),
                        //Loading Indicator
                        Positioned(
                          top: 200,
                          child: Container(
                            width: Get.width,
                            alignment: Alignment.topCenter,
                            child: _.getLoading()
                                ? BounceInDown(
                                    duration: Duration(
                                      milliseconds: 200,
                                    ),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Get.isDarkMode
                                            ? MyColorTheme.light
                                            : MyColorTheme.dark,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              PageChanger(),
              TopBar(),
              Obx(
                () {
                  final c = Get.find<ProductSearchController>();
                  return c.getSearchOn() ? SearchBox() : Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
