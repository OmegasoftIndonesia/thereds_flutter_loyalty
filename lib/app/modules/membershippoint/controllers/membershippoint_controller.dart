import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/modules/home/controllers/home_controller.dart';

import '../../../util/dialog_util.dart';
import '../../../util/shared_prefs.dart';

class MembershippointController extends GetxController {
  //TODO: Implement MembershippointController
  final double currentHour = 120;
  double targetHour = 120 + 230; // Total target ke Level 4
  RxDouble progress = 0.0.obs;
  final count = 0.obs;
  HomeController homeController = Get.find<HomeController>();
  RxString level = "".obs;
  RxString Nextlevel = "".obs;
  RxString totalSpending="".obs;
  RxString nextReward = "".obs;
  RxString sisaHour = "".obs;
  PreferencesUtil util = PreferencesUtil();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    asignValue();
  }

  void refresh()async{
     homeController.getMemberLevel();
     asignValue();
  }

  void asignValue(){
    if(homeController.memberLevel.value.data!.length<=0){
      DialogUtil.show("Data Tidak Ditemukan, Silahkan coba lagi setelah beberapa saat.");
    }else{
      Nextlevel.value = homeController.memberLevel.value.data![0].nextLevelName!;
      level.value = homeController.memberLevel.value.data![0].levelName!;
      totalSpending.value = homeController.memberLevel.value.data![0].nextMinHour!;
      sisaHour.value = homeController.memberLevel.value.data![0].sisaNextHour!;
      nextReward.value = double.parse(homeController.memberLevel.value.data![0].nextRewardPoint!).toInt().toString();

      progress.value =  (int.parse(totalSpending.value) / (int.parse(totalSpending.value)+int.parse(sisaHour.value)));
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
