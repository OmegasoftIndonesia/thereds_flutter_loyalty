import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/NumberFormatter.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> datePicker() async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.selectedDate.value ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        helpText: 'Select a date', // Optional text at the top
      );
      if (picked != null) {
        controller.pickDate(picked); // store to controller
      }
    }


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
          'Booking',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(Constants.BGInput),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(() {
                    return TextField(
                      readOnly: true,
                      onTap: datePicker,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: controller.formattedDate,
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                        prefixIcon: Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ),
                Obx(() {
                  return SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 70,
                    child: (controller.listRentObject.value.data != null) ?
                    ListView.builder(
                      itemCount: controller.listRentObject.value.data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              controller.selectIndex.value = index;
                              controller.getPaket(
                                  controller.listRentObject.value.data![index]
                                      .kode!);
                            },
                            child: Obx(() {
                              return Container(
                                width: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: (controller.selectIndex.value == index)
                                      ? Color(Constants.mainColor)
                                      : Color(Constants.BGInput),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "${controller.listRentObject.value
                                      .data![index]
                                      .noRentObject}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ) : SizedBox(),
                  );
                }),
                Obx(() {
                  return Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(Constants.BGInput),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonFormField(
                      icon: Icon(Icons.keyboard_arrow_down, color: Colors
                          .white,),
                      isExpanded: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.sports_esports, color: Colors.white,),
                          border: InputBorder.none
                      ),
                      style: TextStyle(color: Colors.white),
                      dropdownColor: Color(Constants.BGApp),
                      value: controller.dropdownPaketValue.value,
                      items: controller.dropdownPaket,
                      onChanged: (value) {
                        controller.onSelectPaket(value);
                      },
                    ),
                  );
                }),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Color(Constants.BGInput),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.all(8),
                  child: Obx(() {
                    return (controller.times.length<=0)?SizedBox():ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:  controller.times.length,
                      itemBuilder: (BuildContext context, index){
                        return InkWell(
                          onTap: () {
                            controller.checkTime(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(top: BorderSide(
                                    color: Color(Constants.BGApp)
                                ))
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                  child: Center(
                                    child: Text(
                                      controller.times[index]["Jam"]!,
                                      style: const TextStyle(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: controller.getStatusColor(
                                          controller.times[index]["StatusBooking"]!),
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.times[index]["StatusBooking"]!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      // children: controller.times.map((slot) {
                      //
                      // }).toList(),
                    );
                  }),
                ),
                Text(
                    "VIP Room, PS 5 Pro, TV QLED 4K 55 Inch, AC, Sofa 4 seater, No Smoking Room.",
                    style: TextStyle(color: Colors.white, fontSize: 12)
                ),
                RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: "LIST GAME: ", style: TextStyle(color: Color(
                            Constants.mainColor),
                            fontWeight: FontWeight.bold,
                            fontSize: 12)
                        ),
                        TextSpan(
                            text: "PES 2025, Marvel’s Spider-Man 2, God of War Ragnarök, Final Fantasy XVI, Hogwarts Legacy, Astro Bot, Demon’s Souls (Remake), Ratchet & Clank: Rift Apart, Resident Evil Village, Returnal, Deathloop",
                            style: TextStyle(color: Colors.white, fontSize: 12)
                        ),
                      ]
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Total ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)
                                ),
                                TextSpan(
                                    text: " ${NumberFormatter.currency(
                                        controller.total.value)}",
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)
                                ),
                              ]
                          ),
                        );
                      }),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.PAYMENT);
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(Constants.mainColor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("Next", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
