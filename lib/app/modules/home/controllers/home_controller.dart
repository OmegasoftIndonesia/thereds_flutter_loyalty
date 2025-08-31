import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/request/promoRequest.dart';
import 'package:thereds_flutter_loyalty/app/data/response/promoResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  List<promoResponse> promoData = <promoResponse>[];
  RxList<Widget> promoItem= <Widget>[].obs;
  PreferencesUtil util = PreferencesUtil();

  void getPromo()async{
    await promoRequest.connectionAPI().then((onValue){

      onValue.forEach((action){
        promoItem.assignAll([
          InkWell(onTap: (){
            Get.toNamed(Routes.NEWSPROMOTION, arguments: {
              "image" : action.link,
              "detail" : action.isi
            });
          },child: Image.network("${action.link}")),
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
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
