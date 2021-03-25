import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final _name = 'joker'.obs;

  getName() {
    return _name.value;
  }
}
