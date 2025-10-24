import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/approvedraftsoResponse.dart';

import '../Constants.dart';
import '../url.dart';

class approvedraftsoRequest {
  String? token;
  String? kodenota;

  approvedraftsoRequest({this.token, this.kodenota});

  approvedraftsoRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    kodenota = json['kodenota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['kodenota'] = this.kodenota;
    return data;
  }

  static Future<approvedraftsoResponse> connectionAPI(String kodeNota) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.approvedraftso;
      approvedraftsoRequest request = approvedraftsoRequest();
      request.token= Constants.apiToken;
      request.kodenota=kodeNota;

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return approvedraftsoResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}