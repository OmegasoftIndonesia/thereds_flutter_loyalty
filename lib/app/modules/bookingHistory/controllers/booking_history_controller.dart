import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thereds_flutter_loyalty/app/data/NumberFormatter.dart';
import 'package:thereds_flutter_loyalty/app/data/request/detaillistorderRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getlistorderRequest.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';
import 'package:thereds_flutter_loyalty/app/util/injector.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingHistoryController extends GetxController {
  //TODO: Implement BookingHistoryController

  final count = 0.obs;
  RxList<Map<String, dynamic>> listBooking = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> masterList = [];
  RxString selected = "semua".obs;
  void getDetailHistory() async {
    DialogUtil.loadingDialog();
    listBooking.clear();
    masterList.clear();
    await getlistorderRequest.connectionAPI().then((onValuelist) async {
      if (onValuelist.isEmpty || onValuelist.length <= 0) {
        DialogUtil.closeDialog();
        DialogUtil.show("History Booking anda kosong");
      } else {
        onValuelist.sort(
          (a, b) => DateTime.parse(b.tgl!).compareTo(DateTime.parse(a.tgl!)),
        );
        for (var actionList in onValuelist) {
          final onValueDetail = await detaillistorderRequest.connectionAPI(
            actionList.kodenota!,
          );

          listBooking.add({
            "Tanggal": DateFormat(
              "dd-MM-yyyy",
            ).format(DateTime.parse(actionList.tgl!)),
            "Waktu":
                "${DateFormat("HH:mm").format(DateTime.parse(actionList.jamMulai!))} - ${DateFormat("HH:mm").format(DateTime.parse(actionList.jamAkhir!))}",
            "Durasi": actionList.durasiMenit,
            "Ruangan": onValueDetail.ketNoRentObject,
            "Paket": actionList.ketTipeRentObject,
            "TotalPembayaran": NumberFormatter.currency(
              double.parse(actionList.totalBayar!).toInt(),
            ),
            "IDPemesanan": actionList.kodenota,
            "KetStatus": actionList.ketStatus,
          });
          masterList.add({
            "Tanggal": DateFormat(
              "dd-MM-yyyy",
            ).format(DateTime.parse(actionList.tgl!)),
            "Waktu":
                "${DateFormat("HH:mm").format(DateTime.parse(actionList.jamMulai!))} - ${DateFormat("HH:mm").format(DateTime.parse(actionList.jamAkhir!))}",
            "Durasi": actionList.durasiMenit,
            "Ruangan": onValueDetail.ketNoRentObject,
            "Paket": actionList.ketTipeRentObject,
            "TotalPembayaran": NumberFormatter.currency(
              double.parse(actionList.totalBayar!).toInt(),
            ),
            "IDPemesanan": actionList.kodenota,
            "KetStatus": actionList.ketStatus,
          });
        }
        DialogUtil.closeDialog();
      }
    });
  }

  void openWACS() async {
    final String url =
        "https://wa.me/${util.getString(PreferencesUtil.whatsApp)}?text=Hallo";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak dapat membuka WhatsApp';
    }
  }

  void sortList(String Status) {
    List<Map<String, dynamic>> temp = [];
    selected.value = Status;
    if (Status == "selesai") {

      temp.assignAll(
        masterList.where(
          (val) =>
              val['KetStatus'].toString().toLowerCase() == "order complete" ||
              val['KetStatus'].toString().toLowerCase() == "canceled",
        ),
      );
    } else if (Status == "mendatang") {
      temp.assignAll(
        masterList.where(
          (val) =>
              val['KetStatus'].toString().toLowerCase() ==
                  "waiting for confirmation" ||
              val['KetStatus'].toString().toLowerCase() == "orders processed",
        ),
      );
    }else{
      temp.assignAll(masterList);
    }

    listBooking.assignAll(temp);
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
