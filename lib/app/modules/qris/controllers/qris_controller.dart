import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/request/createGopayRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getGopayTransRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/insertpiutangdraftsoRequest.dart';
import 'package:thereds_flutter_loyalty/app/modules/topup/controllers/topup_controller.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

import '../../../routes/app_pages.dart';

class QrisController extends GetxController {
  //TODO: Implement QrisController

  final count = 0.obs;
  TopupController topupController = Get.find<TopupController>();
  RxString url = "".obs;

  void createGopay() async{
    DialogUtil.loadingDialog();
    await createGopayRequest.connectionAPI(topupController.nominal.text).then((onValue){
      if(onValue.statusCode.toString() == "200"){
        DialogUtil.closeDialog();
        url.value = onValue.data!.urlQrcodeRaw!;
        checkPayment(onValue.data!.transactionCode!);
      }
    });
  }

  void checkPayment(String code) async{
    await getGopayTransRequest.connectionAPI(code).then((onValue){
      if(onValue.data!.transactionStatus!.toLowerCase() == "pending" || onValue.data!.transactionStatus!.toLowerCase() == "undefined"){
        checkPayment(code);
      }else{
        insertPiutangDraftSO(code);
      }
    });
  }

  void insertPiutangDraftSO(String kodePay)async{
    await insertpiutangdraftsoRequest.connectionAPI(kodePay, kodePay, topupController.nominal.text).then((onValue){
      if(onValue.status!.toLowerCase() == "success"){
        Get.offNamed(Routes.PAYMENTSUCCESS, arguments: {
          "nominal": topupController.nominal.text,
          "point": topupController.point,
        });
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
    createGopay();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
