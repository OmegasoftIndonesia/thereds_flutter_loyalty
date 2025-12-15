import 'package:get/get.dart';

class DetailNotifController extends GetxController {
  //TODO: Implement DetailNotifController

  final count = 0.obs;
  RxString judul = "".obs;
  RxString keterangan = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    keterangan.value = Get.arguments["keterangan"];
    judul.value = Get.arguments['judul'];
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
