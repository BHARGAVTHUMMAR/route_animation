import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:ui_demo/app/models/categoriesModels.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  AnimationController? animationController;
  RxList<categoriesModel> dataList = RxList<categoriesModel>([]);
  @override
  void onInit() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    animationController!.repeat();
    getCategoryData();
    super.onInit();
  }

  getCategoryData() {
    Map<String, dynamic> categoriesdata = {
      "code": 200,
      "message": "Course subject lists.",
      "data": [
        {
          "categoriesName": "Earth",
          "Image": "earth.png",
          "dis": "384.4k Km",
          "vag": "1.62m/s2"
        },
        {
          "categoriesName": "Mars",
          "Image": "mars.png",
          "dis": "54.6k Km",
          "vag": "3.711m/s2"
        },
        {
          "categoriesName": "Moon",
          "Image": "moon.png",
          "dis": "384.4k Km",
          "vag": "1.62m/s2"
        },
        {
          "categoriesName": "Mercury",
          "Image": "mercury.png",
          "dis": "384.4k Km",
          "vag": "1.62m/s2"
        },
        {
          "categoriesName": "Neptune",
          "Image": "neptune.png",
          "dis": "2.7b Km",
          "vag": "11.5m/s2"
        },
      ],
    };
    if (categoriesdata['code'] == 200) {
      RxList<categoriesModel> tempDataList = RxList<categoriesModel>([]);
      categoriesdata['data'].forEach(
        (data) {
          tempDataList.add(
            categoriesModel(
              categoriesName: data["categoriesName"],
              Image: data["Image"],
              Dis: data["dis"],
              vag: data["vag"],
            ),
          );
        },
      );
      dataList.addAll(tempDataList);
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController!.dispose();
    super.onClose();
  }
}
