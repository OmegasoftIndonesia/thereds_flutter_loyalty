import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/request/ListHistoryPointWithDepositSORequest.dart';
import 'package:thereds_flutter_loyalty/app/data/response/ListHistoryPointWithDepositSOResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

class PointhistoryController extends GetxController {
  //TODO: Implement PointhistoryController

  final count = 0.obs;
  Rx<ListHistoryPointWithDepositSOResponse> dataPoint = ListHistoryPointWithDepositSOResponse().obs;

  void getPointHistory() async{
    DialogUtil.loadingDialog();
    await ListHistoryPointWithDepositSORequest.connectionAPI(30).then((onValue){
      if(onValue.status == "success"){
        DialogUtil.closeDialog();
        dataPoint.value = onValue;
        dataPoint.value.data =
            dataPoint.value.data!.reversed.toList();
      }else{
        DialogUtil.closeDialog();
        DialogUtil.show("Data tidak ditemukan");
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getPointHistory();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
