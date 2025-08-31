import 'package:get/get.dart';

class NewspromotionController extends GetxController {
  //TODO: Implement NewspromotionController

  final count = 0.obs;
  RxString detail = "".obs;
  RxString foto= "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
     detail.value = Get.arguments["detail"];
     foto.value = Get.arguments['image'];
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
