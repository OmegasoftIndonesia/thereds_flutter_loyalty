import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thereds_flutter_loyalty/app/data/request/ListRentObjectRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/request/getGameListByRentObjectRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/response/ListRentObjectResponse.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getGameListByRentObjectResponse.dart';
import 'package:thereds_flutter_loyalty/app/modules/home/controllers/home_controller.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';

import '../../../data/Constants.dart';

class GamelistController extends GetxController {
  //TODO: Implement GamelistController

  final count = 0.obs;
  Rx<ListRentObjectResponse> listRent = ListRentObjectResponse().obs;
  RxList<Widget> GameItem = <Widget>[].obs;
  RxnInt selectIndex = RxnInt();
  List<DataGame> dataGameTemp = [];

  void getRentObject() async {
    DialogUtil.loadingDialog();
    await ListRentObjectRequest.connectionAPI(
      DateFormat("yyyyMMdd").format(DateTime.now()),
    ).then((onValue) async {
      listRent.value = onValue;
      await getGameListByRentObjectRequest.connectionAPI().then((onValueGame) {
        dataGameTemp.addAll(onValueGame.data!);
        onValueGame.data!.forEach((action) {
          GameItem.assign(
            Image.network("${Constants.internetImage}${action.gambar}"),
          );
        });
        DialogUtil.closeDialog();
      });
    });
  }

  void sortGame(String noRent) {
    List<DataGame> qResult = dataGameTemp
        .where((test) => test.noRentObject == noRent)
        .toList();
    GameItem.clear();
    qResult.forEach((action) {
      GameItem.assign(
        Image.network("${Constants.internetImage}${action.gambar}"),
      );
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getRentObject();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
