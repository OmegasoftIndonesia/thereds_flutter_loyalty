import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/modules/home/controllers/home_controller.dart';

class GamelistController extends GetxController {
  //TODO: Implement GamelistController

  final count = 0.obs;
  final HomeController controllerHome = Get.find<HomeController>();

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
