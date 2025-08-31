import 'package:get/get.dart';

import '../controllers/newspromotion_controller.dart';

class NewspromotionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewspromotionController>(
      () => NewspromotionController(),
    );
  }
}
