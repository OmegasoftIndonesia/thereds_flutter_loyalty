import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getPaketByRentObjectResponse.dart';

import '../Constants.dart';
import '../url.dart';

class getPaketByRentObjectRequest {
  String? token;
  String? norentobject;

  getPaketByRentObjectRequest({this.token, this.norentobject});

  getPaketByRentObjectRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    norentobject = json['norentobject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['norentobject'] = this.norentobject;
    return data;
  }

  static Future<getPaketByRentObjectResponse> connectionAPI(String rentObject) async {
    Dio dio = Dio();
    try {
      String URL = URLAPI.getPaketByRentObject;
      getPaketByRentObjectRequest request = getPaketByRentObjectRequest();
      request.token= Constants.apiToken;
      request.norentobject = rentObject;

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";

      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());

      print(response.data);

      return getPaketByRentObjectResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}