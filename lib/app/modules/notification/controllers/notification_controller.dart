import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/request/listNotifikasiRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/response/listNotifikasiResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

  final count = 0.obs;
  RxList<DataNotifikasi> listNotif = <DataNotifikasi>[].obs;

  void listNotifikasi() async{
    DialogUtil.loadingDialog();
    await listNotifikasiRequest.connectionAPI().then((onValue){
      if(onValue.status!.toLowerCase() == "success"){
        DialogUtil.closeDialog();
        listNotif.assignAll(onValue.data!);
        listNotif.refresh();
      }
    });
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    listNotifikasi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
