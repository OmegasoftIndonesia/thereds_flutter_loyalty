import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/newspromotion_controller.dart';

class NewspromotionView extends GetView<NewspromotionController> {
  const NewspromotionView({super.key});

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
          'Promotion & News',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(controller.foto.value, errorBuilder: (context,e,s){
                    return Icon(Icons.info);
                  },),
                  SizedBox(height: 20,),
                  Text(controller.judul.value, style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),),
                  Text(controller.detail.value,
                    style: TextStyle(color: Colors.white, fontSize: 12),)
                ],
              );
            }),
          ),
        ),
      )
    );
  }
}
