import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/ListHistoryDepositWithDepositSOResponse.dart';
import 'package:thereds_flutter_loyalty/app/data/response/ListHistoryPointWithDepositSOResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/injector.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../Constants.dart';
import '../url.dart';

class ListHistoryDepositWithDepositSORequest {
  String? token;
  String? cust;
  String? branch;
  int? harimundur;

  ListHistoryDepositWithDepositSORequest(
      {this.token, this.cust, this.branch, this.harimundur});

  ListHistoryDepositWithDepositSORequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    cust = json['cust'];
    branch = json['branch'];
    harimundur = json['harimundur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['cust'] = this.cust;
    data['branch'] = this.branch;
    data['harimundur'] = this.harimundur;
    return data;
  }

  static Future<ListHistoryDepositWithDepositSOResponse> connectionAPI(int hariMundur) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.ListHistoryDepositWithDepositSO;
      ListHistoryDepositWithDepositSORequest request = ListHistoryDepositWithDepositSORequest();
      request.token= Constants.apiToken;
      request.harimundur=hariMundur;
      request.branch= Constants.branch;
      request.cust=util.getString(PreferencesUtil.kodePelanggan);

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return ListHistoryDepositWithDepositSOResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}