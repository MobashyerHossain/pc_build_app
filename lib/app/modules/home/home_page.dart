import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [],
      ),
      body: Container(
        child: GetX<HomeController>(
          init: HomeController(),
          builder: (_) {
            return Container(
              child: Center(
                child: Text(_.getName()),
              ),
            );
          },
        ),
      ),
    );
  }
}
