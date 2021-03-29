import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  menuMaxHeight: Get.height,
                  value: dropdownValue.value,
                  dropdownColor: Colors.grey.withOpacity(0.2),
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
                          ),
                        );
                      },
                    ).toList();
                  },
                  items: catlist.map<DropdownMenuItem<String>>(
                    (CategoryModel value) {
                      return DropdownMenuItem<String>(
                        value: value.code,
                        child: SectionTitle(
                          title: value.name.replaceAll('_', ' ').toUpperCase(),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(8),
                          textSize: 15,
                        ),
                      );
                    },
                  ).toList(),
                ),
                SectionTitle(
                  title: "Page ${_.getPage()}",
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(8),
                  textSize: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
