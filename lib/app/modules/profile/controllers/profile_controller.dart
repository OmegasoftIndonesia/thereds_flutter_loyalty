import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:thereds_flutter_loyalty/app/data/request/loginOTP2Request.dart';
import 'package:thereds_flutter_loyalty/app/data/request/setCustProfileRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/upload_media_with_retry.dart';
import 'package:thereds_flutter_loyalty/app/routes/app_pages.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_image_picker.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../../../util/dialog_util.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  RxString kotaVal = "".obs;
  RxString dayVal = "".obs;
  RxString monthVal = "".obs;
  RxString yearVal = "".obs;
  var selectedDate = DateTime.now().obs;
  PreferencesUtil util = PreferencesUtil();
  TextEditingController kota = TextEditingController();
  String? selectedDateValue;
  final formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  PickedFile? imageFile;
  PlatformFile? file;
  String? pickedImageFileCurrent;
  RxBool fotoKtpIsChanged = false.obs;
  String? pickedKtpFileCurrent;
  File? pickedImageFile;
  RxString pickedFilePath = "".obs;
  String? profilePicName;
  void setDate(DateTime date) {
    selectedDate.value = date;

    dayVal.value = DateFormat("dd").format(date);
    monthVal.value = DateFormat("MMMM").format(date);
    yearVal.value = DateFormat("yyyy").format(date);

    selectedDateValue = DateFormat("yyyy-MM-dd").format(date);
  }

  void updateCustProfile() async {
    DialogUtil.loadingDialog();
    if (formKey.currentState!.validate()) {
      if(profilePicName == null){
        await setCustProfileRequest
            .connectionAPI(selectedDateValue!, kota.text, (fotoKtpIsChanged.value)?profilePicName!:util.getString(
          PreferencesUtil.fotoProfil
        )!)
            .then((onValue) async {
          if (onValue.status!.toLowerCase() == "success") {
            await loginOTP2Request
                .connectionAPI(util.getString(PreferencesUtil.phone)!)
                .then((onValue) {

              DialogUtil.closeDialog();

              util.putString(PreferencesUtil.kota, onValue.data!.kota!);
              util.putString(
                PreferencesUtil.tglLahir,
                onValue.data!.tglLahir!,
              );
              kotaVal.value = onValue.data!.kota!;
              dayVal.value = DateFormat(
                "dd",
              ).format(DateTime.parse(onValue.data!.tglLahir!));
              monthVal.value = DateFormat(
                "MMMM",
              ).format(DateTime.parse(onValue.data!.tglLahir!));
              yearVal.value = DateFormat(
                "yyyy",
              ).format(DateTime.parse(onValue.data!.tglLahir!));
              util.putString(PreferencesUtil.fotoProfil, onValue.data!.fotoOrangKTP!);
            });
          } else {
            DialogUtil.show("Profile Update Failed");
          }
        });
      }else{
        await uploadMediawithRetry.upload(File(pickedFilePath.value), profilePicName!).then((onValue) async{
          await setCustProfileRequest
              .connectionAPI(selectedDateValue!, kota.text, (fotoKtpIsChanged.value)?profilePicName!:"")
              .then((onValue) async {
            if (onValue.status!.toLowerCase() == "success") {
              await loginOTP2Request
                  .connectionAPI(util.getString(PreferencesUtil.phone)!)
                  .then((onValue) {

                DialogUtil.closeDialog();

                util.putString(PreferencesUtil.kota, onValue.data!.kota!);
                util.putString(
                  PreferencesUtil.tglLahir,
                  onValue.data!.tglLahir!,
                );
                kotaVal.value = onValue.data!.kota!;
                dayVal.value = DateFormat(
                  "dd",
                ).format(DateTime.parse(onValue.data!.tglLahir!));
                monthVal.value = DateFormat(
                  "MMMM",
                ).format(DateTime.parse(onValue.data!.tglLahir!));
                yearVal.value = DateFormat(
                  "yyyy",
                ).format(DateTime.parse(onValue.data!.tglLahir!));
                util.putString(PreferencesUtil.fotoProfil, onValue.data!.fotoOrangKTP!);
              });
            } else {
              DialogUtil.show("Profile Update Failed");
            }
          });
        });
      }
    }
  }

  void SignOut()async{
    util.clearAll();
    Get.offAllNamed(Routes.LOGIN);
  }

  void pickImage()async{
    var result = await Get.dialog(
      PopScope(
        canPop: true, // supaya back button tidak bisa nutup
        child: ImagePickerDialog(isVideo: false,)
      ),
      barrierDismissible: false, // supaya tidak bisa ditutup klik luar
    );
    if (result == "gallery") {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(
          type: FileType.custom, allowedExtensions: ["jpg"]);
      if (result != null) {
        file = result.files.first;
      } else {
        // User canceled the picker
      }
      debugPrint("Image Gallery: ${file!.path}");
      pickedFilePath.value = file!.path!;
      if (file!.name != util.getString(PreferencesUtil.fotoProfil)) {
        fotoKtpIsChanged.value = true;
      } else {
        fotoKtpIsChanged.value = false;
      }
    }
    else if (result == "camera") {
      final getImage =
      await picker.pickImage(source: ImageSource.camera);
      imageFile = PickedFile(getImage!.path);
      pickedImageFile = File(imageFile!.path);

      debugPrint("Image Camera: ${imageFile!.path}");
      pickedFilePath.value = imageFile!.path;
      if (pickedImageFile!.path != util.getString(PreferencesUtil.fotoProfil)) {
        fotoKtpIsChanged.value = true;
      } else {
        fotoKtpIsChanged.value = false;
      }
    }
    if (pickedFilePath.value != "") {
      profilePicName =
      "fotoktp_${pickedFilePath.value.split('/').last}";
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    kotaVal.value = util.getString(PreferencesUtil.kota)!;
    kota.text = util.getString(PreferencesUtil.kota)!;
    dayVal.value = DateFormat(
      "dd",
    ).format(DateTime.parse(util.getString(PreferencesUtil.tglLahir)!));
    monthVal.value = DateFormat(
      "MMMM",
    ).format(DateTime.parse(util.getString(PreferencesUtil.tglLahir)!));
    yearVal.value = DateFormat(
      "yyyy",
    ).format(DateTime.parse(util.getString(PreferencesUtil.tglLahir)!));
    selectedDateValue = DateFormat(
      "yyyy-MM-dd",
    ).format(DateTime.parse(util.getString(PreferencesUtil.tglLahir)!));
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
