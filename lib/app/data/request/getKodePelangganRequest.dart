import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/Constants.dart';
import 'package:thereds_flutter_loyalty/app/data/response/getKodePelangganResponse.dart';

import '../url.dart';

class getKodePelangganRequest {
  String? token;
  String? email;
  String? branch;
  String? telp;

  getKodePelangganRequest({this.token, this.email, this.branch, this.telp});

  getKodePelangganRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    branch = json['branch'];
    telp = json['telp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['email'] = this.email;
    data['branch'] = this.branch;
    data['telp'] = this.telp;
    return data;
  }

  static Future<List<getKodePelangganResponse>> connectionAPI(
      String telp) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.getKodePelanggan;
      getKodePelangganRequest request = getKodePelangganRequest();
      request.token= Constants.apiToken;
      request.email ="noemail";
      request.branch=Constants.cabang;
      request.telp=telp;

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());


      print(response.data);

      return getKodePelangganResponse().parseKodeResponse(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}