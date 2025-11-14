import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/gopayCancel2Response.dart';

import '../../util/injector.dart';
import '../../util/shared_prefs.dart';
import '../Constants.dart';
import '../url.dart';

class gopayCancel2Request {
  String? kodenota;

  gopayCancel2Request({this.kodenota});

  gopayCancel2Request.fromJson(Map<String, dynamic> json) {
    kodenota = json['kodenota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kodenota'] = this.kodenota;
    return data;
  }

  static Future<gopayCancel2Response> connectionAPI(String kode) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.cancelGopay;
      gopayCancel2Request request = gopayCancel2Request();
      request.kodenota = kode;

      dio.options.headers['Authorization']=Constants.apiToken;
      dio.options.headers['Uid']="tZD7CG3idLxrABc6KPpEeVqgXkyawjlH";
      dio.options.headers['server_key'] = util.getString(PreferencesUtil.serverKeyGopay);

      dio.options.contentType = "application/x-www-form-urlencoded";


      Response response = await dio.post(URL, data: request.toJson());


      print("URL: $URL");
      print(response.requestOptions.headers);
      print(
          "${request.toJson()}");
      print(response.data);

      return gopayCancel2Response.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}