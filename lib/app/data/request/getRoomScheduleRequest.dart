import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getRoomScheduleResponse.dart';

import '../Constants.dart';
import '../url.dart';

class getRoomScheduleRequest {
  String? token;
  String? norentobject;
  String? cabang;
  String? tgl;

  getRoomScheduleRequest(
      {this.token, this.norentobject, this.cabang, this.tgl});

  getRoomScheduleRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    norentobject = json['norentobject'];
    cabang = json['cabang'];
    tgl = json['tgl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['norentobject'] = this.norentobject;
    data['cabang'] = this.cabang;
    data['tgl'] = this.tgl;
    return data;
  }

  static Future<getRoomScheduleResponse> connectionAPI(String norent,tgl) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.getRoomSchedule;
      getRoomScheduleRequest request = getRoomScheduleRequest();
      request.token= Constants.apiToken;
      request.tgl=tgl;
      request.cabang=Constants.cabang;
      request.norentobject= norent;

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return getRoomScheduleResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}