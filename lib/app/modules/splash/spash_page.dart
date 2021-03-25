import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (_) => Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spin(
                    child: BounceInDown(
                      child: Image(
                        image: AssetImage('assets/logo/splash_2.gif'),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Roulette(
                    child: ZoomIn(
                      child: Text(
                        'Welcome'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
