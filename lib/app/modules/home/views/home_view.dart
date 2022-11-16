import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_demo/app/constants/api_constants.dart';
import 'package:ui_demo/app/constants/color_constant.dart';
import 'package:ui_demo/app/constants/sizeConstant.dart';
import 'package:ui_demo/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appTheme.primaryTheme,
          elevation: 0,
          title: const Text('HomeView'),
          centerTitle: true,
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)))),
        ),
        body: Container(
          color: appTheme.primaryTheme,
          height: MySize.safeHeight,
          width: MySize.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.offAndToNamed(Routes.DITAILS, arguments: {
                            ArgumentConstant.data: controller.dataList[index]
                          });
                        },
                        child: getData(
                            dis: controller.dataList[index].Dis.toString(),
                            vag: controller.dataList[index].vag.toString(),
                            name: controller.dataList[index].categoriesName
                                .toString(),
                            image: controller.dataList[index].Image.toString()),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 30,
                      );
                    },
                    itemCount: controller.dataList.length)
              ],
            ),
          ),
        ),
      ),
    );
  }

  getData(
      {String image = "earth.png",
      String name = "temp",
      String dis = "",
      String vag = ""}) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 15),
          child: Container(
            height: 150,
            width: 320,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0, top: 30),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MySize.getHeight(28),
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0, top: 10),
                    child: Text(
                      "MilkyWay Galaxy",
                      style: TextStyle(
                          fontSize: MySize.getHeight(15), color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0, top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          dis,
                          style: TextStyle(
                              fontSize: MySize.getHeight(12),
                              color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Icon(
                            Icons.arrow_circle_down_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          vag,
                          style: TextStyle(
                              fontSize: MySize.getHeight(12),
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ]),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(4, 4)),
                ],
                color: appTheme.shedowColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ),
        Positioned(
            right: 280,
            top: 45,
            child: Container(
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0)
                    .animate(controller.animationController!),
                child: Image.asset(imagePath + image),
              ),
              height: 100,
              width: 100,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ))
      ],
    );
  }
}
