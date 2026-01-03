import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../controllers/booking_history_controller.dart';

class BookingHistoryView extends GetView<BookingHistoryController> {
  const BookingHistoryView({super.key});

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
          'Booking History',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Center(
        child: Container(
          child: Obx(() {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.sortList("semua");
                            },
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: (controller.selected.value == "semua")
                                    ? Color(Constants.mainColor)
                                    : Color(Constants.BGInput),
                                border: Border.all(
                                  color: Color(Constants.mainColor),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Semua",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.sortList("mendatang");
                            },
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color:(controller.selected.value == "mendatang")
                                    ? Color(Constants.mainColor)
                                    : Color(Constants.BGInput),
                                border: Border.all(
                                  color: Color(Constants.mainColor),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Mendatang",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.sortList("selesai");
                            },
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: (controller.selected.value == "selesai")
                                    ? Color(Constants.mainColor)
                                    : Color(Constants.BGInput),
                                border: Border.all(
                                  color: Color(Constants.mainColor),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Selesai",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.listBooking.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(Constants.BGInput),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Tanggal",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "Waktu",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "Durasi",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "Ruangan",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "Paket",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "Total Pembayaran",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "ID Pemesanan",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .listBooking[index]['Tanggal'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          controller
                                              .listBooking[index]['Waktu'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          controller
                                              .listBooking[index]['Durasi'] +
                                              " Menit",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          controller
                                              .listBooking[index]['Ruangan'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          controller
                                              .listBooking[index]['Paket'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          controller
                                              .listBooking[index]['TotalPembayaran'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          controller
                                              .listBooking[index]['IDPemesanan'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                (controller.listBooking[index]['KetStatus']
                                    .toString()
                                    .toLowerCase() ==
                                    "waiting for confirmation" ||
                                    controller
                                        .listBooking[index]['KetStatus']
                                        .toString()
                                        .toLowerCase() ==
                                        "Orders Processed")
                                    ? Container(
                                  decoration: BoxDecoration(
                                    color: Color(Constants.mainColor),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  width: MediaQuery
                                      .of(
                                    context,
                                  )
                                      .size
                                      .width,
                                  height: 40,
                                  child: TextButton(
                                    onPressed: () {
                                      controller.openWACS();
                                    },
                                    child: Text(
                                      "Hubungi Customer Service",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                )
                                    : (controller
                                    .listBooking[index]['KetStatus']
                                    .toString()
                                    .toLowerCase() ==
                                    "Order Complete" ||
                                    controller
                                        .listBooking[index]['KetStatus']
                                        .toString()
                                        .toLowerCase() ==
                                        "Canceled") ? Container(
                                  decoration: BoxDecoration(
                                    color: Color(Constants.mainColor),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  width: MediaQuery
                                      .of(
                                    context,
                                  )
                                      .size
                                      .width,
                                  height: 40,
                                  child: TextButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.BOOKING);
                                    },
                                    child: Text(
                                      "Pesan Ulang",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ) : SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
