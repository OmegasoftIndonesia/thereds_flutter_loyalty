import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:thereds_flutter_loyalty/app/data/Constants.dart';
import 'package:thereds_flutter_loyalty/app/data/response/createGopayResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/injector.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../url.dart';

class createGopayRequest {
  String? outlet;
  String? amount;

  createGopayRequest({this.outlet, this.amount});

  createGopayRequest.fromJson(Map<String, dynamic> json) {
    outlet = json['outlet'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['outlet'] = this.outlet;
    data['amount'] = this.amount;
    return data;
  }

  static Future<createGopayResponse> connectionAPI(String amount) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.createGopay;
      createGopayRequest request = createGopayRequest();
      request.amount = amount;
      request.outlet=Constants.branch;

      dio.options.headers['Authorization']=Constants.apiToken;
      dio.options.headers['Uid']="tZD7CG3idLxrABc6KPpEeVqgXkyawjlH";
      dio.options.headers['server_key'] = util.getString(PreferencesUtil.serverKeyGopay);

      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return createGopayResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
