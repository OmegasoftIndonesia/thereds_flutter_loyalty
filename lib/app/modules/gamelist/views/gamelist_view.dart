import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';

import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/gamelist_controller.dart';

class GamelistView extends GetView<GamelistController> {
  const GamelistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BGApp),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamed(Routes.HOME);
          },
          icon: Icon(Icons.chevron_left, color: Colors.white),
        ),
        title: const Text(
          'Game List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 50,
              child: Obx(() {
                return (controller.listRent.value.data == null)
                    ? SizedBox()
                    : ListView.builder(
                  itemCount: controller.listRent.value.data!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        controller.selectIndex.value = index;
                        controller.sortGame(
                          controller
                              .listRent
                              .value
                              .data![index]
                              .kode!,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() {
                          return Container(
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (controller.selectIndex.value == index)
                                  ? Color(Constants.mainColor)
                                  : Color(Constants.BGInput),
                              border: Border.all(
                                color: Color(Constants.mainColor),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              controller
                                  .listRent
                                  .value
                                  .data![index]
                                  .noRentObject!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                );
              }),
            ),
            Obx(() {
              return Expanded(
                child: CarouselSlider(
                  items: controller.GameItem,
                  options: CarouselOptions(
                    height: 170,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.vertical,
                  ),
                ),
                // ListView.builder(
                //     itemCount: controller.controllerHome.GameItem.length,
                //     scrollDirection: Axis.vertical,
                //     itemBuilder: (BuildContext context, index){
                //       return Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Image.network("${Constants.internetImage}${}"),
                //       );
                //     })
              );
            }),
          ],
        ),
      ),
    );
  }
}
