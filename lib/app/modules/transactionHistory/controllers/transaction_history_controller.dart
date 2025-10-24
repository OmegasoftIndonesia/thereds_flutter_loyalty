import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/response/ListHistoryDepositWithDepositSOResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

import '../../../data/request/ListHistoryDepositWithDepositSORequest.dart';

class TransactionHistoryController extends GetxController {
  //TODO: Implement TransactionHistoryController

  final count = 0.obs;

  Rx<ListHistoryDepositWithDepositSOResponse> listDepo = ListHistoryDepositWithDepositSOResponse().obs;

  void getMemberWallet()async{
    DialogUtil.loadingDialog();
    await ListHistoryDepositWithDepositSORequest.connectionAPI(30).then((onValue){
      DialogUtil.closeDialog();
      listDepo.value = onValue;
    });
  }


  @override
  void onInit() {
    super.onInit();
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
