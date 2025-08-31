import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/request/loginOTP2Request.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController hp = TextEditingController();
  final count = 0.obs;

  void cekLogin() async{
    DialogUtil.loadingDialog();
    await loginOTP2Request.connectionAPI(hp.text).then((onValue){

      DialogUtil.closeDialog();

      if(onValue.status == "success"){

        Get.offAllNamed(Routes.OTP, arguments: {
          "custData":onValue.data
        });
      }else{
        DialogUtil.show("Login Gagal, Silahkan coba lagi setelah beberapa saat.");
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
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
