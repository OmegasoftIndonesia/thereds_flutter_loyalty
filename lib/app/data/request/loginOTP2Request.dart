import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/Constants.dart';
import 'package:thereds_flutter_loyalty/app/data/response/loginOTP2Response.dart';
import 'package:thereds_flutter_loyalty/app/data/url.dart';

import '../../util/shared_prefs.dart';

class loginOTP2Request {
  String? token;
  String? email;
  String? branch;

  loginOTP2Request({this.token, this.email, this.branch});

  loginOTP2Request.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['email'] = this.email;
    data['branch'] = this.branch;
    return data;
  }

  static Future<loginOTP2Response> connectionAPI(
      String emailtelp) async {
    Dio dio = Dio();
    try {
      String URL = URLAPI.loginOTP2;
      loginOTP2Request request = loginOTP2Request();
      request.token = Constants.apiToken;
      request.branch = Constants.branch;
      request.email = emailtelp;
      dio.options.headers = {};
      dio.options.contentType = "application/json";
      print("URL: $URL");
      print(
          "Token: ${request.token}, branch: ${request.branch}, email: ${request.email}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return loginOTP2Response.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}