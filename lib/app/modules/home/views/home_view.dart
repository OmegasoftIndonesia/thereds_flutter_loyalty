import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/modules/transactionHistory/views/transaction_history_view.dart';
import 'package:thereds_flutter_loyalty/app/routes/app_pages.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../../../data/Constants.dart';
import '../../../data/NumberFormatter.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BGApp),
      appBar: AppBar(
        backgroundColor: Color(Constants.BGApp),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            Constants.internetImage +
                controller.util.getString(PreferencesUtil.fotoProfil)!,
          ),
        ),
        title: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'profile') {
              // aksi buka profil
            } else if (value == 'logout') {
              // aksi logout
            }
          },
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: () {
                Get.toNamed(Routes.PROFILE);
              },
              value: 'profile',
              child: Text('Profile'),
            ),
          ],
          child: Row(
            children: [
              Text(
                "${controller.util.getString(PreferencesUtil.name)}",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.offNamed(Routes.BOOKING_HISTORY);
            },
            icon: ImageIcon(AssetImage(
                "${Constants.imageAsset}ActivityHistory.png"
            ), color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.NOTIFICATION);
            },
            icon: Icon(Icons.notifications, color: Colors.white),
          ),

        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return controller.refresh();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(Constants.BGInput),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                Image.asset(
                                  Constants.imageAsset + "Wallet.png",
                                  width: 100,
                                  height: 25,
                                ),
                                Obx(() {
                                  return Text(
                                    NumberFormatter.decimal(
                                      double.parse(
                                        controller.walletMember.value,
                                      ).toInt(),
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.TOPUP);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(Constants.mainColor),
                                            borderRadius:
                                            BorderRadius.circular(50),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8,
                                              top: 3,
                                              bottom: 3,
                                            ),
                                            child: Text(
                                              "Top Up",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                            Routes.TRANSACTION_HISTORY,
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(Constants.mainColor),
                                            borderRadius:
                                            BorderRadius.circular(50),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8,
                                              top: 3,
                                              bottom: 3,
                                            ),
                                            child: Text(
                                              "History",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(color: Colors.white, width: 10),
                          SizedBox(
                            child: Column(
                              children: [
                                Image.asset(
                                  Constants.imageAsset + "Gift.png",
                                  width: 100,
                                  height: 25,
                                ),
                                Obx(() {
                                  return Text(
                                    "${NumberFormatter.decimal(double.parse(controller.pointMember.value).toInt())}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.MEMBERSHIPPOINT);
                                        },
                                        child: Obx(() {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Color(
                                                Constants.mainColor,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(50),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8,
                                                top: 3,
                                                bottom: 3,
                                              ),
                                              child: Text(
                                                "${controller.level.value}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                      SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.POINTHISTORY);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(Constants.mainColor),
                                            borderRadius:
                                            BorderRadius.circular(50),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8,
                                              top: 3,
                                              bottom: 3,
                                            ),
                                            child: Text(
                                              "History",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Promotion & News",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: CarouselSlider(
                      items: controller.promoItem,
                      options: CarouselOptions(
                        height: 170,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(
                          milliseconds: 800,
                        ),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Game List",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(() {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.GAMELIST);
                      },
                      child: Container(
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
                            autoPlayAnimationDuration: Duration(
                              milliseconds: 800,
                            ),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(Constants.mainColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.BOOKING);
                      },
                      child: Text(
                        "Booking",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
