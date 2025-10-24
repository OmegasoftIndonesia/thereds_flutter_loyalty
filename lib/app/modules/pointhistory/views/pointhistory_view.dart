import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thereds_flutter_loyalty/app/data/NumberFormatter.dart';

import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../controllers/pointhistory_controller.dart';

class PointhistoryView extends GetView<PointhistoryController> {
  const PointhistoryView({super.key});

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
          'Point History',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Center(
        child: Obx(() {
          return (controller.dataPoint.value.data != null)?Container(
            child: ListView.builder(
              itemCount: controller.dataPoint.value.data!.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(Constants.BGInput),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(Constants.imageAsset + "token.png",
                                width: 35, height: 35,),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Text(
                                        "${controller.dataPoint.value.data![index]
                                            .keterangan}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15
                                        ),),
                                    ),
                                    Text("${DateFormat('EEEE').format(
                                        DateTime.parse(
                                            controller.dataPoint.value
                                                .data![index].tgl!))}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12
                                        )),
                                    Text("${DateFormat('MM dd, yyyy - HH.mm')
                                        .format(DateTime.parse(
                                        controller.dataPoint.value.data![index]
                                            .tgl!))}", style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text("${NumberFormatter.decimal(double.parse(
                              controller.dataPoint.value.data![index].balance!)
                              .toInt())}"
                              , style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },),
          ):SizedBox();
        }),
      ),
    );
  }
}
