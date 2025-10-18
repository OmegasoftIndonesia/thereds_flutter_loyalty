import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TopupController extends GetxController {
  //TODO: Implement TopupController

  final count = 0.obs;
  final isChecked = true.obs;
  TextEditingController nominal = TextEditingController();
  String point="0";
  @override
  void onInit() {
    super.onInit();
  }

  void checkCaraPembayaran(bool value){
    if(value){
      isChecked.value = false;
    }else{
      isChecked.value = true;
    }
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
