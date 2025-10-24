import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/Constants.dart';
import '../../home/views/home_view.dart';
import '../controllers/qris_controller.dart';

class QrisView extends GetView<QrisController> {
  const QrisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BGApp),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.off(() => HomeView());
          },
          icon: Icon(Icons.chevron_left, color: Colors.white),
        ),
        title: const Text(
          'Top Up',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Text(
                  """Download QRIS dibawah ini dan lakukan\npembayaran di platform pembayaran\nfavorit Anda""",
                  textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.white,

                ),),
              ),
              Obx(() {
                return (controller.url == "")?SizedBox():Image.network("${controller.url}", width: MediaQuery
                    .of(context)
                    .size
                    .width, height: 500,);
              }),
              InkWell(
                onTap: () {
                  //controller.insertPiutangDraftSO(controller.kodePay!);
                  controller.downloadQR();
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
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text("Download QRIS", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
