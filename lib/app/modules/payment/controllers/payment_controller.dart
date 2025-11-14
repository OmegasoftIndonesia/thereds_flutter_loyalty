import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/request/approvedDraftSORequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/cart2Request.dart';
import 'package:thereds_flutter_loyalty/app/data/request/insertpiutangdraftsoRequest.dart';
import 'package:thereds_flutter_loyalty/app/modules/booking/controllers/booking_controller.dart';
import 'package:thereds_flutter_loyalty/app/routes/app_pages.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';
import 'package:thereds_flutter_loyalty/app/util/injector.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../../../data/request/ListHistoryDepositWithDepositSORequest.dart';
import '../../../data/request/ListHistoryPointWithDepositSORequest.dart';
import '../../../data/response/ListHistoryDepositWithDepositSOResponse.dart';
import '../../../data/response/ListHistoryPointWithDepositSOResponse.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController

  final count = 0.obs;
  RxString selectedValue = "wallet".obs;
  BookingController bookingController = Get.find<BookingController>();
  final dataArg = Get.arguments;
  RxString total = "0".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (util.isKeyExists(PreferencesUtil.ppn)!) {
      double ppn =
          (double.parse(dataArg['total']).toInt() *
              double.parse(util.getString(PreferencesUtil.ppn)!).toInt()) /
          100;
      total.value = double.parse(
        (double.parse(dataArg['total']).toInt() + ppn).toString(),
      ).toInt().toString();
    } else {
      total.value = (double.parse(dataArg['total']).toInt()).toString();
    }
  }

  void insertCart2(String bentukDana) async {
    DialogUtil.loadingDialog();
    bool isValid = false;
    if (bentukDana == 'Uang Muka') {
      await ListHistoryDepositWithDepositSORequest.connectionAPI(1).then((
        onValue,
      ) {
        List<DataSaldo> data = onValue.data!.reversed.toList();
        if (double.parse(data[0].depositBalance!).toInt() >
            double.parse(total.value).toInt()) {
          isValid = true;
        } else {
          DialogUtil.closeDialog();
          DialogUtil.show(
            "Saldo wallet anda tidak cukup untuk melakukan pembayaran",
          );
        }
      });
    } else if (bentukDana == "Point") {
      await ListHistoryPointWithDepositSORequest.connectionAPI(1).then((
        onValue,
      ) {
        List<DataPoint> data = onValue.data!.reversed.toList();
        if (double.parse(data[0].balance!).toInt() >
            double.parse(total.value).toInt()) {
          isValid = true;
        } else {
          DialogUtil.closeDialog();
          DialogUtil.show(
            "RedPoint anda tidak cukup untuk melakukan pembayaran",
          );
        }
      });
    }

    if (isValid) {
      Detail newDetail = Detail();
      newDetail.productUid = dataArg['paket'].jenisPekerjaan;
      newDetail.note = "";
      newDetail.quantity = 1;
      newDetail.amount = double.parse(dataArg['paket'].nominal).toInt();
      newDetail.disc2 = 0;
      newDetail.disc3 = 0;
      newDetail.discvaluepost = 0;
      newDetail.tipe = "nonstok";
      newDetail.satuan = "";
      newDetail.paket = "_";
      newDetail.jmlpaket = 1;
      newDetail.rasio = 1;

      cart2Request
          .connectionAPI(
            newDetail,
            double.parse(total.value).toInt(),
            dataArg['rentObject'].kode,
            dataArg['paket'].kode,
            dataArg['jamAwal'],
            dataArg['jamAkhir'],
            dataArg['tglBooking'].toString(),
            dataArg['paket'].jenisPekerjaan,
            bentukDana,
          )
          .then((cartResp) async {
            if (cartResp.status == "success") {
              await insertpiutangdraftsoRequest
                  .connectionAPI(
                    cartResp.kodenota!,
                    cartResp.kodenota,
                    double.parse(total.value).toInt().toString(),bentukDana
                  )
                  .then((onValueInsertPiutang) async {
                    await approvedraftsoRequest
                        .connectionAPI(cartResp.kodenota!)
                        .then((onValueapprove) {
                          DialogUtil.closeDialog();
                          Get.toNamed(
                            Routes.PAYMENTSUCCESS,
                            arguments: {
                              "nominal": total.value,
                              "point": "0",
                              "bentukDana": bentukDana,
                              "purpose": "booking",
                            },
                          );
                        });
                  });
            }
          });
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
