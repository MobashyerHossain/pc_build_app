import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/data/models/category_model.dart';
import 'package:pc_build_app/app/global_widgets/section_title.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      width: Get.width,
      child: GetX<ProductController>(
        init: ProductController(),
        builder: (_) {
          final catlist = _.getCatrgories();
          var dropdownValue = _.getCategory().toString().obs;
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SectionTitle(
                  thumb: Image(
                    // height: 50,
                    image: ResizeImage(
                      AssetImage(_.getWebsite().logo),
                      height: 20,
                    ),
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue.value,
                  dropdownColor: Get.isDarkMode
                      ? MyColorTheme.light.withOpacity(0.6)
                      : MyColorTheme.dark.withOpacity(0.6),
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: Colors.transparent,
                  ),
                  iconSize: 24,
                  elevation: 0,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  onChanged: (String? newValue) {
                    _.setCategory(newValue);
                    _.fetchProducts(1, newValue, null);
                  },
                  selectedItemBuilder: (BuildContext context) {
                    return catlist.map<Widget>(
                      (CategoryModel value) {
                        return GestureDetector(
                          child: SectionTitle(
                            title:
                                value.name.replaceAll('_', ' ').toUpperCase(),
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(8),
                            textSize: 15,
                            thumb: Image(
                              // height: 50,
                              image: ResizeImage(
                                AssetImage(value.thumb),
                                height: 20,
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList();
                  },
                  items: catlist.map<DropdownMenuItem<String>>(
                    (CategoryModel value) {
                      return DropdownMenuItem<String>(
                        value: value.code,
                        child: Container(
                          width: Get.width / 2.5,
                          child: Row(
                            children: [
                              Image(
                                height: 30,
                                image: AssetImage(value.thumb),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                value.name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Get.isDarkMode
                                      ? MyColorTheme.dark
                                      : MyColorTheme.light,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                SectionTitle(
                  title: "P - ${_.getPage()}",
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(8),
                  textSize: 15,
                ),
                // SectionTitle(
                //   title: "P - ${_.getPage()}",
                //   alignment: Alignment.centerLeft,
                //   padding: EdgeInsets.all(8),
                //   textSize: 15,
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
