import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thereds_flutter_loyalty/app/data/request/insertCustRequest.dart';
import 'package:thereds_flutter_loyalty/app/routes/app_pages.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final count = 0.obs;
  TextEditingController name = TextEditingController();
  TextEditingController hp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController ttl = TextEditingController();
  TextEditingController kota = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var selectedDate = DateTime.now().obs;
  var selectedItem = ''.obs;

  void setDate(DateTime date) {
    selectedDate.value = date;

    ttl.text = DateFormat("dd/MM/yyyy").format(date);
  }

  void registerUser() async {
    if(formKey.currentState!.validate()){
      DialogUtil.loadingDialog();
      await insertCustRequest
          .connectionAPI(email.text, hp.text, name.text, kota.text)
          .then((onValue) {
        if(onValue.status!.toLowerCase() == "success"){
          DialogUtil.closeDialog();
          DialogUtil.show("Register Success");
          Get.offAllNamed(Routes.LOGIN);
        }else{
          DialogUtil.show("Register Failed");
        }
      });
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
