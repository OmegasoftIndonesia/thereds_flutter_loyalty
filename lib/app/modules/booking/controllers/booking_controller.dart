import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  //TODO: Implement BookingController
  final count = 0.obs;

  var selectedDate = Rxn<DateTime>();
  RxInt selectedpaket = 2.obs;

  RxList<Map<String, dynamic>> times = <Map<String, dynamic>>[
    {"number":0,"time": "01.00", "status": "Booked"},
    {"number":1,"time": "02.00", "status": "Booked"},
    {"number":2,"time": "03.00", "status": "Booked"},
    {"number":3,"time": "04.00", "status": ""},
    {"number":4,"time": "05.00", "status": ""},
    {"number":5,"time": "06.00", "status": ""},
    {"number":6,"time": "07.00", "status": "Booked"},
    {"number":7,"time": "08.00", "status": ""},
    {"number":8,"time": "09.00", "status": "Booked"},
    {"number":9,"time": "10.00", "status": "Booked"},
    {"number":10,"time": "11.00", "status": "Booked"},
    {"number":11,"time": "12.00", "status": ""},
    {"number":12,"time": "13.00", "status": "Booked"},
    {"number":13,"time": "14.00", "status": "Booked"},
    {"number":14,"time": "15.00", "status": "Booked"},
    {"number":15,"time": "16.00", "status": ""},
    {"number":16,"time": "17.00", "status": ""},
    {"number":17,"time": "18.00", "status": ""},
    {"number":18,"time": "19.00", "status": "Booked"},
    {"number":19,"time": "20.00", "status": ""},
    {"number":20,"time": "21.00", "status": ""},
    {"number":21,"time": "22.00", "status": "Booked"},
    {"number":22,"time": "23.00", "status": ""},
    {"number":23,"time": "24.00", "status": ""},
  ].obs;

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

  void pickDate(DateTime date) {
    selectedDate.value = date;
  }

  void checkTime(int start){
    RxList<Map<String, dynamic>> tempMap = times.map((e) => Map<String, dynamic>.from(e)).toList().obs;
    int successCtr=0;
    for(int i = start; i<(start+selectedpaket.value); i++){
      var select = times.firstWhere((test) => test['number'] == i);
      if(select['status'] != ""){
       tempMap.clear();
       print("Waktu tidak valid");
       break;
      }else{
        int idx = tempMap.indexWhere((test) => test['number'] == i);
        if (idx != -1) {
          tempMap[idx]['status'] = "Selected";
          successCtr++;
        }
      }
    }
    if(successCtr == selectedpaket.value){
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
