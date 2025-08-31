import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/membershippoint_controller.dart';

class MembershippointView extends GetView<MembershippointController> {
  const MembershippointView({super.key});
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
          'Membership Point',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(Constants.BGInput)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Rachel Cia", style: TextStyle(color: Colors.white, fontSize: 15),),
                Text("LEVEL 3", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Spending", style: TextStyle(color: Colors.white),),
                    Text("120 Hour", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: LinearProgressIndicator(
                    value: controller.progress.value,
                    minHeight: 20,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    backgroundColor: Color(0xFFCBC9F7), // Ungu muda
                  ),
                ),
                SizedBox(height: 20,),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  children: [
                    TextSpan(text: "Spend "),
                    TextSpan(text: "230 Hour ", style: TextStyle(
                      fontWeight: FontWeight.bold
                    )),
                    TextSpan(text: "more to reach "),
                    TextSpan(text: "LEVEL 4", style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    TextSpan(text: "and you will get "),
                    TextSpan(text: "400.000 Points", style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(Constants.mainColor)
                    ))
                  ]
                ))
              ],
            ),
          ),
        ),
      )
    );
  }
}
