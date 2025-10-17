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

  List<DropdownMenuItem<String>> tempList = [];

  getPaketByRentObjectResponse? paketList;
  RxList<Map<String, dynamic>> times = <Map<String, dynamic>>[

  ].obs;

  // {"number": 0, "time": "00.00", "status": ""},
  // {"number": 1, "time": "01.00", "status": ""},
  // {"number": 2, "time": "02.00", "status": ""},
  // {"number": 3, "time": "03.00", "status": ""},
  // {"number": 4, "time": "04.00", "status": ""},
  // {"number": 5, "time": "05.00", "status": ""},
  // {"number": 6, "time": "06.00", "status": ""},
  // {"number": 7, "time": "07.00", "status": ""},
  // {"number": 8, "time": "08.00", "status": ""},
  // {"number": 9, "time": "09.00", "status": ""},
  // {"number": 10, "time": "10.00", "status": ""},
  // {"number": 11, "time": "11.00", "status": ""},
  // {"number": 12, "time": "12.00", "status": ""},
  // {"number": 13, "time": "13.00", "status": ""},
  // {"number": 14, "time": "14.00", "status": ""},
  // {"number": 15, "time": "15.00", "status": ""},
  // {"number": 16, "time": "16.00", "status": ""},
  // {"number": 17, "time": "17.00", "status": ""},
  // {"number": 18, "time": "18.00", "status": ""},
  // {"number": 19, "time": "19.00", "status": ""},
  // {"number": 20, "time": "20.00", "status": ""},
  // {"number": 21, "time": "21.00", "status": ""},
  // {"number": 22, "time": "22.00", "status": ""},
  // {"number": 23, "time": "23.00", "status": ""},
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
    await ListRentObjectRequest.connectionAPI(DateFormat("yyyyMMdd").format(date)).then((onValue){
      listRentObject.value = onValue;
      DialogUtil.closeDialog();
    });
  }

  void getPaket(String rentObject) async {
    DialogUtil.loadingDialog();
    await getPaketByRentObjectRequest.connectionAPI(rentObject).then((onValue) {
      DialogUtil.closeDialog();
      tempList.clear();
      dropdownPaket.clear();
      paketList = onValue;
      selectedpaket.value = 0;
      if(onValue.data!.length>0){
        onValue.data!.forEach((action) {
          tempList.add(
            DropdownMenuItem(
              value: action.kode,
              child: Text("${action.keterangan}", style: TextStyle(color: Colors.white)),
            ),
          );
        });
        dropdownPaket.assignAll(tempList);
        dropdownPaketValue.value = onValue.data![0].kode!;
        selectedpaket.value = double.parse(onValue.data![0].duration!).toInt();
        total.value =double.parse(onValue.data![0].nominal!).toInt();
      }

      getRoomSchedule(rentObject,DateFormat("yyyy-MM-dd").format(selectedDate.value!));
    });
  }

  void getRoomSchedule(String norent, tgl)async{
    RxList<Map<String, dynamic>> tempMap = times
        .map((e) => Map<String, dynamic>.from(e))
        .toList()
        .obs;
    for(int i = 0; i<tempMap.length;i++){
      tempMap[i]['status'] = "";
    }
    await getRoomScheduleRequest.connectionAPI(norent, tgl).then((onValue){
      RxList<Map<String, dynamic>> tempMap = onValue.data!.map((e)=>Map<String,dynamic>.from(e.toJson())).toList().obs;
      times.assignAll(tempMap);
      times.refresh();
    });
  }
  void onSelectPaket(value){
    dropdownPaketValue.value = value!;
    if(paketList != null){
      var durasi= paketList!.data!.firstWhere((test)=>test.kode == value);
      selectedpaket.value = double.parse(durasi.duration!).toInt();
      total.value = double.parse(durasi.nominal!).toInt();
    }
  }

  void checkTime(int start) {
    RxList<Map<String, dynamic>> tempMap = times
        .map((e) => Map<String, dynamic>.from(e))
        .toList()
        .obs;
    int successCtr = 0;

    tempMap.forEach((a){
      if(a["StatusBooking"] == "Selected"){
        a["StatusBooking"]="AVAILABLE";
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
        successCtr++;
      }
    }
    print("paket: ${selectedpaket.value}");
    if (successCtr == selectedpaket.value) {
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
