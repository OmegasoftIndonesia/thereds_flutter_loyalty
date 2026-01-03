import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/special_offer_controller.dart';

class SpecialOfferView extends GetView<SpecialOfferController> {
  const SpecialOfferView({super.key});
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
          'Special Offers For You',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Center(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("${Constants.imageAsset}sample2.png"),
                    SizedBox(height: 20,),
                    Text("Headline", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),
                    Text("""Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc pellentesque in urna a dignissim. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum dignissim libero at diam consequat hendrerit. Donec iaculis rutrum iaculis. Mauris vitae nisi vitae nunc laoreet bibendum.\nCras id imperdiet metus. Proin gravida ligula in ligula scelerisque, ut tempor augue interdum. Nunc libero lectus, commodo ac scelerisque non, pretium elementum felis. Mauris congue feugiat est, eget gravida erat vulputate in. Nam malesuada nisi ut sapien consequat dapibus. Phasellus rutrum et massa euismod euismod.\nSed nec elementum neque, vel consectetur nibh. Aenean commodo tristique sapien, eget interdum dolor euismod vel. Ut condimentum ullamcorper lacus mollis lobortis. Aliquam vitae est quis est rhoncus dictum quis quis sapien. Nunc sit amet efficitur tellus, id molestie sapien. Integer lacinia dignissim lorem, quis rutrum mi molestie nec. Sed ex enim, porta ut sagittis eu, sagittis vel ligula. Curabitur vel finibus diam, vel posuere velit. Curabitur et nulla sed dui pulvinar venenatis. Suspendisse risus tellus, mollis a urna at, ullamcorper fermentum sem.""",
                      style: TextStyle(color: Colors.white, fontSize: 12),)
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
