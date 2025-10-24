import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getlistorderResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/injector.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../Constants.dart';
import '../url.dart';

class getlistorderRequest {
  String? token;
  String? cabang;
  String? email;

  getlistorderRequest({this.token, this.cabang, this.email});

  getlistorderRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    cabang = json['cabang'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['cabang'] = this.cabang;
    data['email'] = this.email;
    return data;
  }

  static Future<List<getlistorderResponse>> connectionAPI() async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.getlistorder;
      getlistorderRequest request = getlistorderRequest();
      request.token= Constants.apiToken;
      request.cabang=Constants.branch;
      request.email= util.getString(PreferencesUtil.email);

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return getlistorderResponse().parseResponse(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}