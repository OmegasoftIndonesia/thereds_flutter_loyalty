import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/aboutResponse.dart';

import '../Constants.dart';
import '../url.dart';

class aboutRequest {
  String? token;
  String? branch;
  String? app;

  aboutRequest({this.token, this.branch, this.app});

  aboutRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    branch = json['branch'];
    app = json['app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['branch'] = this.branch;
    data['app'] = this.app;
    return data;
  }

  static Future<aboutResponse> connectionAPI() async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.about;
      aboutRequest request = aboutRequest();
      request.token= Constants.apiToken;
      request.branch=Constants.branch;
      request.app = Constants.appName;

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return aboutResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}