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

      if(onValue.message!.toLowerCase().contains("success")){
        Get.offAllNamed(Routes.OTP, arguments: {
          "custData":onValue.data
        });
      }else if(onValue.message!.toLowerCase().contains("register")){
        DialogUtil.show("Nomor tidak terdaftar, Silahkan melakukan pendaftaran terlebih dahulu");
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
    final message = Get.arguments?["message"];
    if (message != null) {
      DialogUtil.show(message);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
