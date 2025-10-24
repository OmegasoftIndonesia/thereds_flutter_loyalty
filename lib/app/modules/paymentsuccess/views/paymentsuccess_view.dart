import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/NumberFormatter.dart';

import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../controllers/paymentsuccess_controller.dart';

class PaymentsuccessView extends GetView<PaymentsuccessController> {
  const PaymentsuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BGApp),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(Routes.HOME)!.then((onValue) {
              controller.homeController.refresh();
            });
          },
          icon: Icon(Icons.chevron_left, color: Colors.white),
        ),
        title: const Text(
          'Payment Success',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "${Constants.imageAsset}logo.png",
                width: 200,
                height: 150,
              ),
              Image.asset(
                "${Constants.imageAsset}success.png",
                width: 70,
                height: 70,
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Text(
                  "${NumberFormatter.decimal(
                      int.parse(controller.data["nominal"]))}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Text(
                  (controller.data["purpose"] == "topup") ?
                  "Top Up Sukses!" : "Pembayaran Sukses!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Text(
                  (controller.data["purpose"] == "topup") ?
                  "Kamu baru saja mengisi ${NumberFormatter.decimal(int.parse(
                      controller
                          .data["nominal"]))} Redcoin ke akunmu. Bonus +${controller
                      .data['point']} XP langsung masuk! Selamat Bermain di The Reds Gaming Lounge!":
                  "Pembayaran untuk booking sebesar ${NumberFormatter.decimal(int.parse(
                      controller
                          .data["nominal"]))} berhasil.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Text(
                  "Selamat Bermain!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Get.offAllNamed(Routes.HOME)!.then((onValue) {
                    controller.homeController.refresh();
                  });
                },
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(Constants.mainColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Back To Homepage",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
