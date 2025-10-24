import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/detaillistorderResponse.dart';

import '../Constants.dart';
import '../url.dart';

class detaillistorderRequest {
  String? token;
  String? kodenota;

  detaillistorderRequest({this.token, this.kodenota});

  detaillistorderRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    kodenota = json['kodenota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['kodenota'] = this.kodenota;
    return data;
  }

  static Future<detaillistorderResponse> connectionAPI(String kode) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.detail_listorder;
      detaillistorderRequest request = detaillistorderRequest();
      request.token= Constants.apiToken;
      request.kodenota=kode;

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return detaillistorderResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}