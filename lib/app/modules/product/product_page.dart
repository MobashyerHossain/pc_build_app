import 'package:animate_do/animate_do.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/data/models/category_model.dart';
import 'package:pc_build_app/app/global_widgets/floating_button.dart';
import 'package:pc_build_app/app/global_widgets/section_title.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/page_change_indicator.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/page_changer.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/product_item_card.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/top_bar.dart';
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
                          child: ZoomIn(
                            delay: Duration(
                              milliseconds: 50,
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: ResizeImage(
                                    AssetImage('assets/logo/splash_2.gif'),
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            PageChanger(),
            TopBar(),
          ],
        ),
      ),
    );
  }
}
