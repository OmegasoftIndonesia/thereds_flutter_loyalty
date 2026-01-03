import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thereds_flutter_loyalty/app/data/request/approvedDraftSORequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/cart2Request.dart';
import 'package:thereds_flutter_loyalty/app/data/request/createGopayRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getGopayTransRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/gopayCancel2Request.dart';
import 'package:thereds_flutter_loyalty/app/data/request/insertpiutangdraftsoRequest.dart';
import 'package:thereds_flutter_loyalty/app/modules/topup/controllers/topup_controller.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';

class QrisController extends GetxController with WidgetsBindingObserver {
  //TODO: Implement QrisController

  final count = 0.obs;
  RxString url = "".obs;
  final dataArgs = Get.arguments;
  String? kodePay;
  var progress = 0.0.obs;
  var isDownloading = false.obs;
  var filePath = ''.obs;
  var savedToGallery = false.obs;
  String? LastCode="";
  bool _isActive = true;
  HomeController homeController = Get.find<HomeController>();

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
    // await getGopayTransRequest.connectionAPI(code).then((onValue) {
    //   if (onValue.data!.transactionStatus!.toLowerCase() == "pending" ||
    //       onValue.data!.transactionStatus!.toLowerCase() == "undefined") {
    //     checkPayment(code);
    //   } else if(onValue.data!.transactionStatus!.toLowerCase() != "cancel") {
    //     insertPiutangDraftSO(code);
    //   }
    // });
    LastCode =code;
    try {
      final onValue = await getGopayTransRequest.connectionAPI(code);

      if (onValue.data?.transactionStatus == null) return;

      final status = onValue.data!.transactionStatus!.toLowerCase();

      if (status == "pending" || status == "undefined") {
        checkPayment(code);
      } else if (status != "cancel") {
        insertPiutangDraftSO(code);
      }
    } on SocketException {
      // App backgrounded → ignore
      return;
    } on HttpException {
      // Same case
      return;
    } on DioException catch (e) {
      final err = e.error;

      if (err is SocketException ||
          err is HttpException ||
          err is OSError ||
          e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        // App backgrounded → expected → ignore
        return;
      }

      rethrow; // real Dio error
    } catch (e) {
      // Real error
      rethrow;
    }
  }

  void cancelGopayPayment() async {
    DialogUtil.loadingDialog();
    await gopayCancel2Request.connectionAPI(kodePay!).then((onValue) {
      if (onValue.statusCode == 200) {
        DialogUtil.closeDialog();
        Get.offAllNamed(Routes.HOME)!.then((onValue) {
          homeController.refresh();
        });
      }
    });
  }

  void insertPiutangDraftSO(String kodePay) async {
    if (dataArgs['purpose'] == "booking") {
      Detail newDetail = Detail();
      newDetail.productUid = dataArgs['paket'].jenisPekerjaan;
      newDetail.note = "";
      newDetail.quantity = 1;
      newDetail.amount = double.parse(dataArgs['paket'].nominal).toInt();
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
              await insertpiutangdraftsoRequest
                  .connectionAPI(
                    kodePay,
                    cartResp.kodenota!,
                    dataArgs["total"],
                    "GOPAY",
                  )
                  .then((onValue) async {
                    if (onValue.status!.toLowerCase() == "success") {
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
          });
    } else if (dataArgs['purpose'] == "topup") {
      await insertpiutangdraftsoRequest
          .connectionAPI(kodePay, kodePay, dataArgs["total"], "GOPAY")
          .then((onValue) {
            if (onValue.status!.toLowerCase() == "success") {
              Get.offNamed(
                Routes.PAYMENTSUCCESS,
                arguments: {
                  "nominal": dataArgs["total"],
                  "point": dataArgs["point"],
                  "bentukDana": "QRIS",
                  "purpose": dataArgs['purpose'],
                },
              );
            }
          });
    }
  }

  void downloadQR() async {
    String savePath = "";
    try {
      isDownloading.value = true;
      progress.value = 0.0;

      var status = await Permission.photos.request();
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
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onReady() {
    super.onReady();
    createGopay();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _isActive = state == AppLifecycleState.resumed;

    if (_isActive) {
      // User returned from GoPay
      checkPayment(LastCode!);
    }
  }

  void increment() => count.value++;
}
