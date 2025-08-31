import 'package:get/get.dart';

class MembershippointController extends GetxController {
  //TODO: Implement MembershippointController
  final double currentHour = 120;
  double targetHour = 120 + 230; // Total target ke Level 4
  RxDouble progress = (120 / (120+230)).obs;
  final count = 0.obs;
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
