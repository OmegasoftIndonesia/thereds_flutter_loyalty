import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getGameListResponse.dart';

import '../Constants.dart';
import '../url.dart';

class getGameListRequest {
  String? token;
  String? branch;

  getGameListRequest({this.token, this.branch});

  getGameListRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['branch'] = this.branch;
    return data;
  }

  static Future<getGameListResponse> connectionAPI() async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.getGameList;
      getGameListRequest request = getGameListRequest();
      request.token= Constants.apiToken;
      request.branch=Constants.cabang;

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return getGameListResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}