import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thereds_flutter_loyalty/app/data/request/ListRentObjectRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getPaketByRentObjectRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getRoomScheduleRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/response/ListRentObjectResponse.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getPaketByRentObjectResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

class BookingController extends GetxController {
  //TODO: Implement BookingController
  final count = 0.obs;

  var selectedDate = Rxn<DateTime>();
  RxList<DropdownMenuItem> dropdownPaket = <DropdownMenuItem>[].obs;
  RxInt selectedpaket = 0.obs;
  RxString dropdownPaketValue = "".obs;
  RxInt total = 0.obs;
  RxnInt selectIndex = RxnInt();
  Rx<ListRentObjectResponse> listRentObject = ListRentObjectResponse().obs;
  DataPaket? paket;
  List<DropdownMenuItem<String>> tempList = [];
  DataRent? kodeRent;
  String? jamAwal;
  String? jamAkhir;
  getPaketByRentObjectResponse? paketList;
  RxList<Map<String, dynamic>> times = <Map<String, dynamic>>[].obs;
  var durasi;

  Color getStatusColor(String status) {
    switch (status) {
      case "Booked":
        return Colors.red.withAlpha(80);
      case "Selected":
        return Colors.green.withAlpha(80);
      default:
        return Colors.transparent;
    }
  }

  String get formattedDate {
    if (selectedDate.value == null) return "Select a date";
    return DateFormat('dd/MM/yyyy').format(selectedDate.value!);
  }

  void pickDate(DateTime date) async {
    DialogUtil.loadingDialog();
    selectedDate.value = date;
    await ListRentObjectRequest.connectionAPI(
      DateFormat("yyyyMMdd").format(date),
    ).then((onValue) {
      listRentObject.value = onValue;
      DialogUtil.closeDialog();
    });
  }

  void getPaket(String rentObject) async {
    DialogUtil.loadingDialog();
    await getPaketByRentObjectRequest.connectionAPI(rentObject).then((onValue) {
      DialogUtil.closeDialog();
      kodeRent = listRentObject.value.data!.firstWhere(
        (test) => test.kode == rentObject,
      );
      tempList.clear();
      dropdownPaket.clear();
      paketList = onValue;
      selectedpaket.value = 0;
      total.value = 0;
      jamAkhir = null;
      jamAwal = null;
      if (onValue.data!.length > 0) {
        onValue.data!.forEach((action) {
          tempList.add(
            DropdownMenuItem(
              value: action.kode,
              child: Text(
                "${action.keterangan}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
        dropdownPaket.assignAll(tempList);
        dropdownPaketValue.value = (onValue.data!.length > 0)
            ? onValue.data![0].kode!
            : "";
        paket = onValue.data![0];
        selectedpaket.value = double.parse(onValue.data![0].duration!).toInt();
        durasi = paketList!.data!.firstWhere(
          (test) => test.kode == onValue.data![0].kode!,
        );
      } else {
        dropdownPaketValue.value = (onValue.data!.length > 0)
            ? onValue.data![0].kode!
            : "";
      }

      getRoomSchedule(
        rentObject,
        DateFormat("yyyy-MM-dd").format(selectedDate.value!),
      );
    });
  }

  void getRoomSchedule(String norent, tgl) async {
    RxList<Map<String, dynamic>> tempMap = times
        .map((e) => Map<String, dynamic>.from(e))
        .toList()
        .obs;
    for (int i = 0; i < tempMap.length; i++) {
      tempMap[i]['status'] = "";
    }
    await getRoomScheduleRequest.connectionAPI(norent, tgl).then((onValue) {
      RxList<Map<String, dynamic>> tempMap = onValue.data!
          .map((e) => Map<String, dynamic>.from(e.toJson()))
          .toList()
          .obs;
      times.assignAll(tempMap);
      times.refresh();
    });
  }

  void onSelectPaket(value) {
    dropdownPaketValue.value = value!;
    if (paketList != null) {
      durasi = paketList!.data!.firstWhere((test) => test.kode == value);
      selectedpaket.value = double.parse(durasi.duration!).toInt();
      paket = durasi;
      jamAwal = null;
      jamAkhir = null;
      getRoomSchedule(
        listRentObject.value.data![selectIndex.value!.toInt()].kode!,
        DateFormat("yyyy-MM-dd").format(selectedDate.value!),
      );
    }
  }

  void checkTime(int start) {
    RxList<Map<String, dynamic>> tempMap = times
        .map((e) => Map<String, dynamic>.from(e))
        .toList()
        .obs;
    int successCtr = 0;

    tempMap.forEach((a) {
      if (a["StatusBooking"] == "Selected") {
        a["StatusBooking"] = "AVAILABLE";
      }
    });

    for (int i = start; i < (start + selectedpaket.value); i++) {
      var select = times[i];
      //times.firstWhere((test) => test['number'] == i);
      if (select['StatusBooking'] == "BOOKED") {
        tempMap.clear();
        DialogUtil.show("Jam ini sudah di booking, silahkan pilih jam lain");
        break;
      } else {
        //int idx = tempMap.indexWhere((test) => test['number'] == i);
        tempMap[i]['StatusBooking'] = "Selected";
        jamAwal =
            "${DateFormat("yyyy-MM-dd").format(selectedDate.value!)} ${times[start]['Jam']}";
        jamAkhir =
            "${DateFormat("yyyy-MM-dd").format(selectedDate.value!)} ${times[start + selectedpaket.value]["Jam"]}";
        successCtr++;
      }
    }
    print("paket: ${selectedpaket.value}");
    print("jamAwal: $jamAwal");
    print("jamAkhir: $jamAkhir");
    if (successCtr == selectedpaket.value) {
      total.value = double.parse(durasi.nominal!).toInt();
      times.assignAll(tempMap);
      times.refresh();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
