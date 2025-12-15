import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/request/aboutRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getKodePelangganRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/sendOTPRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/validateOTPRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/response/loginOTP2Response.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

import '../../../routes/app_pages.dart';
import '../../../util/shared_prefs.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

  final count = 0.obs;
  final DataLogin data = Get.arguments['custData'];
  TextEditingController otp = TextEditingController();
  PreferencesUtil util = PreferencesUtil();
  String? editedNumber;

  void editNumber() {
    if (data.noHP!.toString().startsWith("0")) {
      editedNumber = data.noHP.toString().replaceFirst("0", "62");
    } else if (data.noHP!.toString().startsWith("+")) {
      editedNumber = data.noHP.toString().replaceFirst("+", "");
    } else if (!data.noHP!.toString().startsWith("62")) {
      editedNumber = "62${data.noHP.toString()}";
    }
  }

  void sendOTP() async {
    editNumber();

    await sendOTPRequest.connectionAPI(int.parse(editedNumber!));
  }

  void validateOTP() async {
    DialogUtil.loadingDialog();
    if(otp.text.isEmpty || otp.text == ""){
      DialogUtil.closeDialog();
      DialogUtil.show("Anda belum memasukan kode OTP");
    }else{
      editNumber();
      await validateOTPRequest
          .connectionAPI(int.parse(editedNumber!), otp.text)
          .then((onValue) async {
        if (onValue.status!) {
          util.putString(PreferencesUtil.name, data.namaLengkap!);
          util.putString(PreferencesUtil.phone, editedNumber!);
          util.putString(PreferencesUtil.email, data.email!);
          util.putString(PreferencesUtil.kota, data.kota!);
          util.putString(PreferencesUtil.tglLahir, data.tglLahir!);
          util.putString(PreferencesUtil.fotoProfil, data.fotoOrangKTP!);
          await getKodePelangganRequest
              .connectionAPI(data.noHP.toString())
              .then((onValue) async {
            util.putString(
              PreferencesUtil.kodePelanggan,
              onValue[0].kode!,
            );

            await aboutRequest.connectionAPI().then((onValue) {
              util.putString(PreferencesUtil.whatsApp, onValue.wa!);
              if (data.pKP == "0") {
                if (onValue.isPPN != "0") {
                  util.putString(
                    PreferencesUtil.ppn,
                    onValue.pajakPOSRetail!,
                  );
                } else {
                  util.putString(PreferencesUtil.ppn, "0");
                }
              } else {
                util.putString(
                  PreferencesUtil.ppn,
                  onValue.pajakPOSRetail!,
                );
              }
            });

            Get.offAllNamed(Routes.HOME);
          });
        } else {
          DialogUtil.closeDialog();
          DialogUtil.show("OTP salah");
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
    sendOTP();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
