import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/modules/search/search_controller.dart';

class ProductSearchPage extends GetView<ProductSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductSearchPage'),
      ),
      body: SafeArea(
        child: Text('ProductSearchController'),
      ),
    );
  }
}
