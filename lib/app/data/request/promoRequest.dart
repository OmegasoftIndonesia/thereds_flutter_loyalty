import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/promoResponse.dart';

import '../Constants.dart';
import '../url.dart';

class promoRequest {
  String? token;
  String? branch;

  promoRequest({this.token, this.branch});

  promoRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['branch'] = this.branch;
    return data;
  }
  static Future<List<promoResponse>> connectionAPI() async {
    Dio dio = Dio();
    String URL = URLAPI.promo;
    promoRequest request = promoRequest();
    request.token= Constants.apiToken;
    request.branch= Constants.branch;
    dio.options.headers = {};
    dio.options.contentType = "application/x-www-form-urlencoded";
    print("URL: $URL");
    print("${request.toJson()}");
    Response response = await dio.post(URL, data: request.toJson());


    print(response.data);

    return promoResponse().parseResponse(jsonDecode(response.data));
    // try {
    //
    // } catch (e) {
    //   rethrow;
    // }
  }
}