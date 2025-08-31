import 'package:get/get.dart';

import '../controllers/membershippoint_controller.dart';

class MembershippointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MembershippointController>(
      () => MembershippointController(),
    );
  }
}
