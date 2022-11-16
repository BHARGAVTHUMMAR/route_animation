import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_demo/app/constants/api_constants.dart';
import 'package:ui_demo/app/constants/color_constant.dart';
import 'package:ui_demo/app/constants/sizeConstant.dart';
import 'package:ui_demo/app/routes/app_pages.dart';
import '../controllers/ditails_controller.dart';

class DitailsView extends GetWidget<DitailsController> {
  const DitailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed(Routes.HOME);
        return await true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: MySize.safeHeight,
            width: MySize.safeWidth,
            color: appTheme.primaryTheme,
            child: Column(
              children: [
                SizedBox(height: 100),
                getView(
                    dis: controller.data!.Dis.toString(),
                    vag: controller.data!.vag.toString(),
                    name: controller.data!.categoriesName.toString(),
                    image: controller.data!.Image.toString()),
              ],
            ),
          ),
          backgroundColor: appTheme.primaryTheme,
          bottomNavigationBar: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          color: appTheme.shedowColor,
                          child: Center(
                              child: Text(
                            "Welcome to " +
                                controller.data!.categoriesName.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[200],
                                fontSize: 30),
                          )),
                        ),
                        Container(
                            height: (MySize.isMini)
                                ? MySize.getHeight(373)
                                : MySize.getHeight(381),
                            width: MySize.getWidth(360),
                            child: Column(children: [
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                child: RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(controller.animationController!),
                                  child: Image.asset(imagePath +
                                      controller.data!.Image.toString()),
                                ),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Distance to sun",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                controller.data!.Dis.toString(),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Distance to Earth",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                controller.data!.vag.toString(),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            color: appTheme.primaryTheme),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
            ),
          ),
        ),
      ),
    );
  }

  getView(
      {String image = "", String name = "", String dis = "", String vag = ""}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 280,
          width: 320,
          child: Column(
            children: [
              Spacer(),
              Container(
                height: 200,
                width: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "MilkyWay Galaxy",
                      style: TextStyle(
                          fontSize: MySize.getHeight(15), color: Colors.grey),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
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
                          ]),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 8.0),
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
            ],
          ),
        ),
        Positioned(
            bottom: 140,
            child: Container(
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0)
                    .animate(controller.animationController!),
                child: Image.asset(imagePath + image),
              ),
              height: 125,
              width: 125,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ))
      ],
    );
  }
}
