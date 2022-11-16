import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:ui_demo/app/constants/api_constants.dart';
import 'package:ui_demo/app/models/categoriesModels.dart';

class DitailsController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController? animationController;
  categoriesModel? data;
  @override
  void onInit() {
    if (Get.arguments != null) {
      data = Get.arguments[ArgumentConstant.data];
    }
    animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    animationController!.repeat();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
