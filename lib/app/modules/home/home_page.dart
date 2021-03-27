import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/data/services/bottom_bar_service.dart';
import 'package:pc_build_app/app/global_widgets/floating_button.dart';
import 'package:pc_build_app/app/global_widgets/section_title.dart';
import 'package:pc_build_app/app/modules/home/home_controller.dart';
import 'package:pc_build_app/app/modules/home/local_widgets/item_card.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';
import 'package:pc_build_app/app/routes/app_pages.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingButton(
          fabKey: fabKey,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: Get.isDarkMode
                  ? <Color>[
                      Colors.grey.shade900,
                      Colors.grey.shade600,
                    ]
                  : <Color>[
                      Colors.grey.shade100,
                      Colors.grey.shade500,
                    ],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 1,
                child: SectionTitle(
                  title: 'Websites'.toUpperCase(),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(8),
                ),
              ),
              Expanded(
                flex: 3,
                child: GetX<HomeController>(
                  init: HomeController(),
                  builder: (_) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _.getWebsites().length,
                      itemBuilder: (context, index) {
                        final _sites = _.getWebsites();
                        var _selected = BottomBarService().index == null
                            ? _.getSite()
                            : BottomBarService().index;
                        return GestureDetector(
                          child: Container(
                            width: Get.width / 3,
                            child: Center(
                              child: SizedBox(
                                height: 150,
                                child: Card(
                                  color: Get.isDarkMode
                                      ? _selected == index
                                          ? MyColorTheme.light.withOpacity(.4)
                                          : MyColorTheme.light.withOpacity(.2)
                                      : _selected == index
                                          ? MyColorTheme.dark.withOpacity(.4)
                                          : MyColorTheme.dark.withOpacity(.2),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      image: AssetImage(_sites[index].logo),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            BottomBarService().switchIndex(
                              index,
                            );
                            _.setSite(index);
                            print(index);
                            Get.appUpdate();
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: SectionTitle(
                  title: 'Categories'.toUpperCase(),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(8),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
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
                                if (fabKey.currentState!.isOpen) {
                                  fabKey.currentState!.close();
                                }
                                Get.find<ProductController>().fetchProducts(
                                  1,
                                  categories[index].code,
                                  null,
                                );
                                Get.toNamed(
                                  Routes.PRODUCT,
                                );
                              },
                              child: Center(
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
                              ),
                            );
                          },
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.count(
                                  index % 3 == 2 ? 2 : 1, 1),
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 0.0,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
