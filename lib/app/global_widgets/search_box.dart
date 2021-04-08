import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/modules/search/search_controller.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.clear();
    _searchController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? MyColorTheme.dark.withOpacity(0.6)
            : MyColorTheme.light.withOpacity(0.6),
      ),
      child: BounceInDown(
        delay: Duration(
          milliseconds: 300,
        ),
        child: GetX<ProductSearchController>(
          init: ProductSearchController(),
          builder: (_) {
            return Center(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _searchController,
                  onFieldSubmitted: (String value) {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      _.setSearchOn(false);
                      _.searchProducts();
                    }
                  },
                  onChanged: (String value) {
                    _.setSearchKey(value);
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Search',
                    labelStyle: TextStyle(
                      color: Get.isDarkMode
                          ? MyColorTheme.light
                          : MyColorTheme.dark,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Get.isDarkMode
                            ? MyColorTheme.light
                            : MyColorTheme.dark,
                      ),
                    ),
                    alignLabelWithHint: true,
                    hintText: _.getSearchKey() == ''
                        ? 'Seach...'
                        : 'Last Searched : ${_.getSearchKey()}',
                    hintStyle: TextStyle(
                      color: Get.isDarkMode
                          ? MyColorTheme.light.withOpacity(.5)
                          : MyColorTheme.dark.withOpacity(.5),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
