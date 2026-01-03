import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thereds_flutter_loyalty/app/data/NumberFormatter.dart';
import 'package:thereds_flutter_loyalty/app/routes/app_pages.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

import '../../../data/Constants.dart';
import '../controllers/topup_controller.dart';

class TopupView extends GetView<TopupController> {
  const TopupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BGApp),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.chevron_left, color: Colors.white),
        ),
        title: const Text(
          'Top Up',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Obx(() {
        return Center(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(Constants.BGInput),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Constants.imageAsset + "Wallet.png",
                                width: 100,
                                height: 25,
                              ),
                              Text(
                                NumberFormatter.decimal(double.parse(controller.walletMember.value).toInt()),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Masukan Nominal Top Up", style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(Constants.BGInput),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          readOnly: true,
                          controller: controller.nominal,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,

                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        customTopUpButton(50000, 5000),
                        customTopUpButton(100000, 10000),
                        customTopUpButton(250000, 25000),
                      ],
                    ),
                    Row(
                      children: [
                        customTopUpButton(1, 1),
                        customTopUpButton(500000, 50000),
                        customTopUpButton(1000000, 100000),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Metode Pembayaran", style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("${Constants.imageAsset}qris.png", width: 70, height: 50,),
                              Text("QRIS", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SizedBox(
                              width: 10,
                              height: 10,
                              child: Checkbox(
                                value: controller.isChecked.value,
                                shape: CircleBorder(),
                                activeColor: Color(Constants.mainColor),
                                onChanged: (bool? value) {
                                  controller.checkCaraPembayaran(value!);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        if(controller.nominal.text==""||controller.nominal.text == null){
                          DialogUtil.show("Anda belum memasukan nominal Top-Up");
                        }else{
                          Get.toNamed(Routes.QRIS, arguments: {
                            "total" :controller.nominal.text,
                            "point" :controller.point,
                            "purpose": "topup"
                          });
                        }

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(Constants.mainColor),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Pay", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            )
        );
      }),
    );
  }

  Widget customTopUpButton(int nominal, int point) {
    return InkWell(
      onTap: (){
        controller.nominal.text = nominal.toString();
        controller.point = point.toString();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8),
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: Color(Constants.BGApp),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Color(Constants.mainColor))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${NumberFormatter.currency(nominal)}",
                style: TextStyle(color: Colors.white, fontSize: 12),),
              Text("+ ${NumberFormatter.decimal(point)} Points",
                  style: TextStyle(color: Colors.green, fontSize: 10))
            ],
          ),
        ),
      ),
    );
  }
}
