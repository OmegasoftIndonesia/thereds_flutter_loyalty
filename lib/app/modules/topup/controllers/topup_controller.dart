import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

import '../../../data/request/ListHistoryDepositWithDepositSORequest.dart';
import '../../../data/response/ListHistoryDepositWithDepositSOResponse.dart';

class TopupController extends GetxController {
  //TODO: Implement TopupController

  final count = 0.obs;
  final isChecked = true.obs;
  TextEditingController nominal = TextEditingController();
  String point="0";
  RxString walletMember = "0".obs;
  @override
  void onInit() {
    super.onInit();
  }

  void getMemberWallet()async{
    DialogUtil.loadingDialog();
    await ListHistoryDepositWithDepositSORequest.connectionAPI(1).then((onValue){
      List<DataSaldo> data= onValue.data!.reversed.toList();
      walletMember.value = data[0].depositBalance!;
      DialogUtil.closeDialog();
    });
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
    getMemberWallet();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
