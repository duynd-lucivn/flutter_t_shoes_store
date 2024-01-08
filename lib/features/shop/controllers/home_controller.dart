import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  final carousalCurrentIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => carousalCurrentIndex.value = index;
}
