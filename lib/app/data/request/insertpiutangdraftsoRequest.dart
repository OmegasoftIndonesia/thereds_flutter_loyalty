import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/insertpiutangdraftsoResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/injector.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../Constants.dart';
import '../url.dart';

class insertpiutangdraftsoRequest {
  String? token;
  String? cabang;
  String? cust;
  String? kodenota;
  String? kodepayment;
  String? bank;
  String? amount;

  insertpiutangdraftsoRequest(
      {this.token,
        this.cabang,
        this.cust,
        this.kodenota,
        this.kodepayment,
        this.bank,
        this.amount});

  insertpiutangdraftsoRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    cabang = json['cabang'];
    cust = json['cust'];
    kodenota = json['kodenota'];
    kodepayment = json['kodepayment'];
    bank = json['bank'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['cabang'] = this.cabang;
    data['cust'] = this.cust;
    data['kodenota'] = this.kodenota;
    data['kodepayment'] = this.kodepayment;
    data['bank'] = this.bank;
    data['amount'] = this.amount;
    return data;
  }

  static Future<insertpiutangdraftsoResponse> connectionAPI(String kodePay, kodeNota, amount) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.getGameList;
      insertpiutangdraftsoRequest request = insertpiutangdraftsoRequest();
      request.token= Constants.apiToken;
      request.amount = amount;
      request.cabang= util.getString(PreferencesUtil.cabang);
      request.cust = util.getString(PreferencesUtil.kodePelanggan);
      request.kodenota = kodeNota;
      request.kodepayment = kodePay;
      request.bank="GOPAY";

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return insertpiutangdraftsoResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}