import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getMemberLevelResponse.dart';

import '../../util/shared_prefs.dart';
import '../Constants.dart';
import '../url.dart';

class getMemberLevelRequest {
  String? token;
  String? branch;
  String? cust;

  getMemberLevelRequest({this.token, this.branch, this.cust});

  getMemberLevelRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    branch = json['branch'];
    cust = json['cust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['branch'] = this.branch;
    data['cust'] = this.cust;
    return data;
  }

  static Future<getMemberLevelResponse> connectionAPI() async {
    Dio dio = Dio();
    PreferencesUtil util = PreferencesUtil();
    try {
      String URL = URLAPI.getMemberLevel;
      getMemberLevelRequest request = getMemberLevelRequest();
      request.token= Constants.apiToken;
      request.branch=Constants.cabang;
      request.cust = "0000J/01/00001U"; //util.getString(PreferencesUtil.kodePelanggan);

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return getMemberLevelResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}