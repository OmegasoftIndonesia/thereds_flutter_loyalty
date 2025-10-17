import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getGameListRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getMemberLevelRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/promoRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getMemberLevelResponse.dart';
import 'package:thereds_flutter_loyalty/app/data/response/promoResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';
import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  List<promoResponse> promoData = <promoResponse>[];
  RxList<Widget> promoItem = <Widget>[].obs;
  PreferencesUtil util = PreferencesUtil();
  RxList<Widget> GameItem = <Widget>[].obs;
  Rx<getMemberLevelResponse> memberLevel= getMemberLevelResponse().obs;
  RxString level = "".obs;

  void getMemberLevel()async{
    await getMemberLevelRequest.connectionAPI().then((onValue){
      level.value = (onValue.data!.length<=0)?"Level 0":onValue.data![0].levelName!;
      memberLevel.value = onValue;
    });
  }

  void getPromo() async {
    await promoRequest.connectionAPI().then((onValue) {
      onValue.forEach((action) {
        promoItem.assignAll([
          InkWell(
            onTap: () {
              Get.toNamed(
                Routes.NEWSPROMOTION,
                arguments: {"image": action.link, "detail": action.isi},
              );
            },
            child: Image.network("${action.link}"),
          ),
        ]);
      });
    });
  }

  void getGameList() async {
    await getGameListRequest.connectionAPI().then((onValue) {
      onValue.data!.forEach((action) {
        GameItem.assignAll([
          Image.network("${Constants.internetImage}${action.gambar}")
        ]);
      });
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getPromo();
    getGameList();
    getMemberLevel();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
