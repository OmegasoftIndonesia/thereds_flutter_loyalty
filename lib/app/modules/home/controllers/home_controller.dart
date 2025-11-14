import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/request/ListHistoryDepositWithDepositSORequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/ListHistoryPointWithDepositSORequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getGameListRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getMemberLevelRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/paymenttypeRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/promoRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/response/ListHistoryDepositWithDepositSOResponse.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getMemberLevelResponse.dart';
import 'package:thereds_flutter_loyalty/app/data/response/promoResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';
import '../../../data/Constants.dart';
import '../../../data/response/ListHistoryPointWithDepositSOResponse.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  List<promoResponse> promoData = <promoResponse>[];
  RxList<Widget> promoItem = <Widget>[].obs;
  PreferencesUtil util = PreferencesUtil();
  RxList<Widget> GameItem = <Widget>[].obs;
  Rx<getMemberLevelResponse> memberLevel = getMemberLevelResponse().obs;
  RxString level = "".obs;
  RxString pointMember = "0".obs;
  RxString walletMember = "0".obs;

  void getMemberLevel() async {
    await getMemberLevelRequest.connectionAPI().then((onValue) {
      level.value = (onValue.data!.length <= 0)
          ? "Level 0"
          : onValue.data![0].levelName!;
      memberLevel.value = onValue;
    });
  }

  void getMemberPoint() async {
    await ListHistoryPointWithDepositSORequest.connectionAPI(1).then((onValue) {
      List<DataPoint> data = onValue.data!.reversed.toList();
      pointMember.value = data[0].balance!;
    });
  }

  void getMemberWallet() async {
    await ListHistoryDepositWithDepositSORequest.connectionAPI(1).then((
      onValue,
    ) {
      List<DataSaldo> data = onValue.data!.reversed.toList();
      walletMember.value = data[0].depositBalance!;
    });
  }

  void getPromo() async {
    await promoRequest.connectionAPI().then((onValue) {
      onValue.forEach((action) {
        promoItem.add(
          InkWell(
            onTap: () {
              Get.toNamed(
                Routes.NEWSPROMOTION,
                arguments: {"image": action.link, "detail": action.isi},
              );
            },
            child: Image.network(
              "${action.link}",
              errorBuilder: (BuildContext context, o, s) {
                return Icon(Icons.error_outline, color: Colors.white);
              },
            ),
          ),
        );
      });
    });
  }

  void getGameList() async {
    GameItem.clear();
    await getGameListRequest.connectionAPI().then((onValue) {
      onValue.data!.forEach((action) {
        print("imageGame: ${Constants.internetImage}${action.gambar}");
        if(action.aktif == "1"){
          GameItem.add(
            Image.network(
              "${Constants.internetImage}${action.gambar}",
              errorBuilder: (BuildContext context, o, s) {
                return Icon(Icons.error_outline, color: Colors.white);
              },
            ),
          );
        }

      });
    });
  }

  void getServerKey() async {
    await paymenttypeRequest.connectionAPI().then((onValue) {
      if (onValue.status == 'success') {
        onValue.data!.forEach((action) {
          if (action.jenis!.toLowerCase().contains('gopay')) {
            util.putString(
              PreferencesUtil.serverKeyGopay,
              action.payParam!.substring(11).replaceAll(';', ''),
            );
          }
        });
      }
    });
  }

  Future<void> refresh() async {
    getPromo();
    getGameList();
    getMemberLevel();
    getMemberPoint();
    getMemberWallet();
    getServerKey();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    DialogUtil.loadingDialog();
    refresh().then((onValue) {
      DialogUtil.closeDialog();
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
