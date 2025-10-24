import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thereds_flutter_loyalty/app/data/NumberFormatter.dart';
import 'package:thereds_flutter_loyalty/app/data/request/detaillistorderRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getlistorderRequest.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

class BookingHistoryController extends GetxController {
  //TODO: Implement BookingHistoryController

  final count = 0.obs;
  RxList<Map<String,dynamic>> listBooking = <Map<String,dynamic>>[].obs;

  void getDetailHistory()async{
    DialogUtil.loadingDialog();
    listBooking.clear();
    await getlistorderRequest.connectionAPI().then((onValuelist){
      if(onValuelist.isEmpty || onValuelist.length <=0){
        DialogUtil.closeDialog();
        DialogUtil.show("History Booking anda kosong");
      }else{
        onValuelist.forEach((actionList) async{
          await detaillistorderRequest.connectionAPI(actionList.kodenota!).then((onValueDetail){
            listBooking.add({
              "Tanggal": DateFormat("dd-MM-yyyy").format(DateTime.parse(actionList.tgl!)),
              "Waktu": "${DateFormat("HH:mm").format(DateTime.parse(actionList.jamMulai!))} - ${DateFormat("HH:mm").format(DateTime.parse(actionList.jamAkhir!))}",
              "Durasi": onValueDetail.ketNoRentObject,
              "Ruangan": onValueDetail.ketNoRentObject,
              "KonsolUtama":"",
              "TotalPembayaran":NumberFormatter.currency(double.parse(actionList.totalBayar!).toInt()),
              "IDPemesanan":actionList.kodenota,
              "KetStatus":actionList.ketStatus
            });
            DialogUtil.closeDialog();
          });
        });
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
    getDetailHistory();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
