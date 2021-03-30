import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/modules/details/product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProductDetailPage')),
      body: SafeArea(
        child: Text('ProductDetailController'),
      ),
    );
  }
}
