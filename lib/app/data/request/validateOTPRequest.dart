import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/validateOTPResponse.dart';

import '../Constants.dart';
import '../url.dart';

class validateOTPRequest {
  int? phone;
  String? token;

  validateOTPRequest({this.phone, this.token});

  validateOTPRequest.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['token'] = this.token;
    return data;
  }

  static Future<validateOTPResponse> connectionAPI(
      int telp, otp) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.validateOTP;
      validateOTPRequest request = validateOTPRequest();
      request.phone = telp;
      request.token= otp;
      dio.options.headers = {};
      dio.options.contentType = "application/json";
      dio.options.headers["Key"] = Constants.apiKeyWA;
      print("URL: $URL");
      print(
          "phone: ${request.phone}, token: ${request.token}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return validateOTPResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}