import 'package:get/get.dart';

import '../controllers/pointhistory_controller.dart';

class PointhistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PointhistoryController>(
      () => PointhistoryController(),
    );
  }
}
