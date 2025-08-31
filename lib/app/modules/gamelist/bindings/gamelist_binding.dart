import 'package:get/get.dart';

import '../controllers/gamelist_controller.dart';

class GamelistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamelistController>(
      () => GamelistController(),
    );
  }
}
