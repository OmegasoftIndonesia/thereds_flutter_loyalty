import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

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
          'Notification',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Center(
          child: Container(
            child: Obx(() {
              return ListView.builder(
                  itemCount: controller.listNotif.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  )
                              )
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Get.toNamed(Routes.DETAIL_NOTIF, arguments: {
                                "judul":controller.listNotif[index]
                                    .judul,
                                "keterangan":controller.listNotif[index]
                                  .keterangan,
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "${Constants.imageAsset}notifLogo.png",
                                  width: 50, height: 50,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("The Reds Official",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                        )),
                                    SizedBox(
                                      width: 170,
                                      child: Text("${controller.listNotif[index]
                                          .judul}",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),),
                                    )
                                  ],
                                ),
                                Text(DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(
                                    controller.listNotif[index].createDate!)),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ))
                              ],
                            ),
                          )
                      ),
                    );
                  });
            }),
          )
      ),
    );
  }
}
