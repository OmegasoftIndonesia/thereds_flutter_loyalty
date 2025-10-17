import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getGopayTransResponse.dart';

import '../Constants.dart';
import '../url.dart';

class getGopayTransRequest {
  String? transactionCode;

  getGopayTransRequest({this.transactionCode});

  getGopayTransRequest.fromJson(Map<String, dynamic> json) {
    transactionCode = json['transaction_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_code'] = this.transactionCode;
    return data;
  }

  static Future<getGopayTransResponse> connectionAPI(String code) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.getGopay;
      getGopayTransRequest request = getGopayTransRequest();
      request.transactionCode = code;

      dio.options.headers['Authorization']=Constants.apiToken;
      dio.options.headers['Uid']="tZD7CG3idLxrABc6KPpEeVqgXkyawjlH";
      dio.options.headers['server_key'] = "Mid-server-alHWl479Kd3suVEmZAoCDUim";

      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return getGopayTransResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}