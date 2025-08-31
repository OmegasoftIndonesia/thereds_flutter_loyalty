import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/setCustProfileResponse.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../Constants.dart';
import '../url.dart';

class setCustProfileRequest {
  String? token;
  String? branch;
  String? cust;
  String? tgllahir;
  String? jeniskelamin;
  String? alamat;
  String? kodepos;
  String? provinsi;
  String? kota;
  String? noktp;
  String? fotoktp;
  String? fotoorangktp;
  String? tempatlahir;

  setCustProfileRequest({
    this.token,
    this.branch,
    this.cust,
    this.tgllahir,
    this.jeniskelamin,
    this.alamat,
    this.kodepos,
    this.provinsi,
    this.kota,
    this.noktp,
    this.fotoktp,
    this.fotoorangktp,
    this.tempatlahir,
  });

  setCustProfileRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    branch = json['branch'];
    cust = json['cust'];
    tgllahir = json['tgllahir'];
    jeniskelamin = json['jeniskelamin'];
    alamat = json['alamat'];
    kodepos = json['kodepos'];
    provinsi = json['provinsi'];
    kota = json['kota'];
    noktp = json['noktp'];
    fotoktp = json['fotoktp'];
    fotoorangktp = json['fotoorangktp'];
    tempatlahir = json['tempatlahir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['branch'] = this.branch;
    data['cust'] = this.cust;
    data['tgllahir'] = this.tgllahir;
    data['jeniskelamin'] = this.jeniskelamin;
    data['alamat'] = this.alamat;
    data['kodepos'] = this.kodepos;
    data['provinsi'] = this.provinsi;
    data['kota'] = this.kota;
    data['noktp'] = this.noktp;
    data['fotoktp'] = this.fotoktp;
    data['fotoorangktp'] = this.fotoorangktp;
    data['tempatlahir'] = this.tempatlahir;
    return data;
  }

  static Future<setCustProfileResponse> connectionAPI(
    String ttl,
    String kota,
      String profile
  ) async {
    Dio dio = Dio();
    PreferencesUtil util = PreferencesUtil();
    try {
      String URL = URLAPI.setCustProfile;
      setCustProfileRequest request = setCustProfileRequest();
      request.token = Constants.apiToken;
      request.cust = util.getString(PreferencesUtil.kodePelanggan);
      request.branch = Constants.branch;
      request.tgllahir = ttl;
      request.kota = kota;
      request.jeniskelamin = "";
      request.alamat = "";
      request.kodepos = "";
      request.provinsi = "";
      request.noktp = "";
      request.fotoktp = "";
      request.fotoorangktp = profile;
      request.tempatlahir = "";

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print("${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());

      print(response.data);

      return setCustProfileResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
