import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/Constants.dart';
import '../../../data/NumberFormatter.dart';
import '../../../routes/app_pages.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

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
          'Payment',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Metode Pembayaran",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                child: Obx(() {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: RadioListTile(
                            activeColor: Color(Constants.mainColor),
                            dense: true,
                            // biar rapat
                            visualDensity: VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            // kurangin padding
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            // padding dalam
                            controlAffinity: ListTileControlAffinity.trailing,
                            // radio di kanan
                            title: Text(
                              "Wallet",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 'wallet',
                            groupValue: controller.selectedValue.value,
                            onChanged: (value) {
                              controller.selectedValue.value = value!;
                            },
                            secondary: Image.asset(
                              "${Constants.imageAsset}walletplain.png",
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: RadioListTile(
                            activeColor: Color(Constants.mainColor),
                            dense: true,
                            // biar rapat
                            visualDensity: VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            // kurangin padding
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            // padding dalam
                            controlAffinity: ListTileControlAffinity.trailing,
                            // radio di kanan
                            title: Text(
                              "QRIS",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 'qris',
                            groupValue: controller.selectedValue.value,
                            onChanged: (value) {
                              controller.selectedValue.value = value!;
                            },
                            secondary: Image.asset(
                              "${Constants.imageAsset}qris.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: RadioListTile(
                            activeColor: Color(Constants.mainColor),
                            dense: true,
                            // biar rapat
                            visualDensity: VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            // kurangin padding
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            // padding dalam
                            controlAffinity: ListTileControlAffinity.trailing,
                            // radio di kanan
                            title: Text(
                              "Gift",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 'gift',
                            groupValue: controller.selectedValue.value,
                            onChanged: (value) {
                              controller.selectedValue.value = value!;
                            },
                            secondary: Image.asset(
                              "${Constants.imageAsset}giftplain.png",
                              width: 24,
                              height: 24,
                            ), // icon di kiri
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              Spacer(),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Total ",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        TextSpan(
                          text:
                              "${NumberFormatter.currency(double.parse(controller.total.value).toInt())}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              InkWell(
                onTap: () {
                  if (controller.selectedValue.value == "qris") {
                    Get.toNamed(
                      Routes.QRIS,
                      arguments: {
                        'purpose': "booking",
                        "total": controller.total.value,
                        'paket': controller.dataArg['paket'],
                        'rentObject': controller.dataArg['rentObject'],
                        'jamAwal': controller.dataArg['jamAwal'],
                        'jamAkhir': controller.dataArg['jamAkhir'],
                        'tglBooking': controller.dataArg['tglBooking']
                      },
                    );
                  }else if(controller.selectedValue.value == "wallet"){
                    controller.insertCart2("Uang Muka");
                  }else if(controller.selectedValue.value == "gift"){
                    controller.insertCart2("Point");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(Constants.mainColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Pay",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
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
