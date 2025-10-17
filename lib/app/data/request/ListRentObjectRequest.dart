import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/ListRentObjectResponse.dart';

import '../Constants.dart';
import '../url.dart';

class ListRentObjectRequest {
  String? token;
  String? cabang;
  String? tgl;
  String? jam;

  ListRentObjectRequest({this.token, this.cabang, this.tgl, this.jam});

  ListRentObjectRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    cabang = json['cabang'];
    tgl = json['tgl'];
    jam = json['jam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['cabang'] = this.cabang;
    data['tgl'] = this.tgl;
    data['jam'] = this.jam;
    return data;
  }

  static Future<ListRentObjectResponse> connectionAPI(String tgl) async {
    Dio dio = Dio();
    try {
      String URL = URLAPI.ListRentObject;
      ListRentObjectRequest request = ListRentObjectRequest();
      request.token= Constants.apiToken;
      request.cabang= Constants.cabang;
      request.tgl = tgl;
      request.jam = "00:00";

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";

      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());

      print(response.data);

      return ListRentObjectResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}