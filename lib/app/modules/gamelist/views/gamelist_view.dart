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
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ListView.builder(
                itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(Constants.BGApp),
                        border: Border.all(color: Color(Constants.mainColor)),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("PS 3",style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                    ),),
                  ),
                );
              })
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("${Constants.imageAsset}sample1.png"),
                      );
                    })
            )
          ],
        )
      ),
    );
  }
}
