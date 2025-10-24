import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thereds_flutter_loyalty/app/data/request/approvedDraftSORequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/cart2Request.dart';
import 'package:thereds_flutter_loyalty/app/data/request/createGopayRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getGopayTransRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/insertpiutangdraftsoRequest.dart';
import 'package:thereds_flutter_loyalty/app/modules/topup/controllers/topup_controller.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

import '../../../routes/app_pages.dart';

class QrisController extends GetxController {
  //TODO: Implement QrisController

  final count = 0.obs;
  RxString url = "".obs;
  final dataArgs = Get.arguments;
  String? kodePay;
  var progress = 0.0.obs;
  var isDownloading = false.obs;
  var filePath = ''.obs;
  var savedToGallery = false.obs;

  void createGopay() async {
    DialogUtil.loadingDialog();
    await createGopayRequest.connectionAPI(dataArgs["total"]).then((onValue) {
      if (onValue.statusCode.toString() == "200") {
        DialogUtil.closeDialog();
        url.value = onValue.data!.urlQrcodeRaw!;
        kodePay = onValue.data!.transactionCode;
        checkPayment(onValue.data!.transactionCode!);
      }
    });
  }

  void checkPayment(String code) async {
    await getGopayTransRequest.connectionAPI(code).then((onValue) {
      if (onValue.data!.transactionStatus!.toLowerCase() == "pending" ||
          onValue.data!.transactionStatus!.toLowerCase() == "undefined") {
        checkPayment(code);
      } else {
        insertPiutangDraftSO(code);
      }
    });
  }

  void insertPiutangDraftSO(String kodePay) async {
    await insertpiutangdraftsoRequest
        .connectionAPI(kodePay, kodePay, dataArgs["total"])
        .then((onValue) {
          if (onValue.status!.toLowerCase() == "success") {
            if (dataArgs['purpose'] == "topup") {
              Get.offNamed(
                Routes.PAYMENTSUCCESS,
                arguments: {
                  "nominal": dataArgs["total"],
                  "point": dataArgs["point"],
                  "bentukDana": "QRIS",
                  "purpose": dataArgs['purpose'],
                },
              );
            } else if (dataArgs['purpose'] == "booking") {
              Detail newDetail = Detail();
              newDetail.productUid = dataArgs['paket'].jenisPekerjaan;
              newDetail.note = "";
              newDetail.quantity = 1;
              newDetail.amount = double.parse(
                dataArgs['paket'].nominal,
              ).toInt();
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
                    double.parse(dataArgs["total"]).toInt(),
                    dataArgs['rentObject'].kode,
                    dataArgs['paket'].kode,
                    dataArgs['jamAwal'],
                    dataArgs['jamAkhir'],
                    dataArgs['tglBooking'].toString(),
                    dataArgs['paket'].jenisPekerjaan,
                    "QRIS",
                  )
                  .then((cartResp) async {
                    if (cartResp.status == "success") {
                      await approvedraftsoRequest
                          .connectionAPI(cartResp.kodenota!)
                          .then((onValue) {
                            if (onValue.status == "success") {
                              Get.offNamed(
                                Routes.PAYMENTSUCCESS,
                                arguments: {
                                  "nominal": dataArgs["total"],
                                  "point": "0",
                                  "bentukDana": "QRIS",
                                  "purpose": dataArgs['purpose'],
                                },
                              );
                            }
                          });
                    }
                  });
            }
          }
        });
  }

  void downloadQR()async{
    String savePath="";
    try {
      isDownloading.value = true;
      progress.value = 0.0;

      var status = await Permission.storage.request();
      if (status.isDenied || status.isPermanentlyDenied) {
        Get.snackbar('Permission', 'Akses galeri ditolak');
        isDownloading.value = false;
        return;
      }

      final dir = await getTemporaryDirectory();
      final fileName = url.value.split('/').last;
      final savePath = '${dir.path}/$fileName.jpg';

      final dio = Dio();

      await dio.download(
        url.value,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            progress.value = (received / total);
          }
        },
      );

      filePath.value = savePath;

      final result = await ImageGallerySaverPlus.saveFile(savePath);
      if (result['isSuccess'] == true || result['filePath'] != null) {
        savedToGallery.value = true;
        DialogUtil.show('Gambar disimpan ke galeri!');
      } else {
        DialogUtil.show('Gagal menyimpan ke galeri.');
      }
    } catch (e) {
      print("Download error: $e");
    } finally {
      isDownloading.value = false;
      print(savePath);
    }
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    createGopay();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
