import 'package:get/get.dart';

import '../controllers/special_offer_controller.dart';

class SpecialOfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecialOfferController>(
      () => SpecialOfferController(),
    );
  }
}
