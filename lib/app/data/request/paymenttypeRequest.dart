import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/Constants.dart';
import 'package:thereds_flutter_loyalty/app/data/response/paymenttypeResponse.dart';

import '../url.dart';

class paymenttypeRequest {
  String? token;
  String? cabang;

  paymenttypeRequest({this.token, this.cabang});

  paymenttypeRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    cabang = json['cabang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['cabang'] = this.cabang;
    return data;
  }

  static Future<paymenttypeResponse> connectionAPI() async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.paymenttype;
      paymenttypeRequest request = paymenttypeRequest();
      request.token= Constants.apiToken;
      request.cabang=Constants.branch;

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return paymenttypeResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}