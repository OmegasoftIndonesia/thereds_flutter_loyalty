import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/listNotifikasiResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../Constants.dart';
import '../url.dart';

class listNotifikasiRequest {
  String? token;
  String? branch;
  String? cust;

  listNotifikasiRequest({this.token, this.branch, this.cust});

  listNotifikasiRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    branch = json['branch'];
    cust = json['cust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['branch'] = this.branch;
    data['cust'] = this.cust;
    return data;
  }

  static Future<listNotifikasiResponse> connectionAPI() async {
    Dio dio = Dio();
    PreferencesUtil util = PreferencesUtil();
    try {
      String URL = URLAPI.listNotifikasi;
      listNotifikasiRequest request = listNotifikasiRequest();
      request.token= Constants.apiToken;
      request.branch=Constants.cabang;
      request.cust= util.getString(PreferencesUtil.kodePelanggan);

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return listNotifikasiResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}