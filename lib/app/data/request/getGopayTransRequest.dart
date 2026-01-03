import 'dart:io';

import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getGopayTransResponse.dart';

import '../../util/injector.dart';
import '../../util/shared_prefs.dart';
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

      dio.options..connectTimeout = const Duration(seconds: 60)..receiveTimeout =  const Duration(seconds: 60);
      dio.options.headers['Authorization']=Constants.apiToken;
      dio.options.headers['Uid']="tZD7CG3idLxrABc6KPpEeVqgXkyawjlH";
      dio.options.headers['server_key'] = util.getString(PreferencesUtil.serverKeyGopay);
      dio.options.headers['Connection']= "close";

      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return getGopayTransResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown &&
          (e.error is SocketException || e.error is HttpException)) {
        throw const SocketException('Connection aborted');
      }
      rethrow;
    }
  }
}