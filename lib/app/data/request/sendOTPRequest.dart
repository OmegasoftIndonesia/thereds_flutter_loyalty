import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/sendOTPResponse.dart';

import '../Constants.dart';
import '../url.dart';

class sendOTPRequest {
  int? phone;
  String? type;

  sendOTPRequest({this.phone, this.type});

  sendOTPRequest.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['type'] = this.type;
    return data;
  }

  static Future<sendOTPResponse> connectionAPI(
      int telp) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.sendOTP;
      sendOTPRequest request = sendOTPRequest();
      request.phone = telp;
      request.type="String";
      dio.options.headers = {};
      dio.options.contentType = "application/json";
      dio.options.headers["Key"] = Constants.apiKeyWA;
      print("URL: $URL");
      print(
          "phone: ${request.phone}, type: ${request.type}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return sendOTPResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}