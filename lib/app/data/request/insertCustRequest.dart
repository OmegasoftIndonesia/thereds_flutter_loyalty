import 'package:dio/dio.dart';
import 'package:thereds_flutter_loyalty/app/data/response/insertCustResponse.dart';

import '../Constants.dart';
import '../url.dart';

class insertCustRequest {
  String? email;
  String? token;
  String? cabang;
  String? custName;
  String? notelp;
  String? kota;
  String? kecamatan;
  String? provinsi;
  String? alamat;
  String? idtt;
  String? segment;
  String? kodereferral;

  insertCustRequest(
      {this.email,
        this.token,
        this.cabang,
        this.custName,
        this.notelp,
        this.kota,
        this.kecamatan,
        this.provinsi,
        this.alamat,
        this.idtt,
        this.segment,
        this.kodereferral});

  insertCustRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    token = json['token'];
    cabang = json['cabang'];
    custName = json['cust_name'];
    notelp = json['notelp'];
    kota = json['kota'];
    kecamatan = json['kecamatan'];
    provinsi = json['provinsi'];
    alamat = json['alamat'];
    idtt = json['idtt'];
    segment = json['segment'];
    kodereferral = json['kodereferral'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['token'] = this.token;
    data['cabang'] = this.cabang;
    data['cust_name'] = this.custName;
    data['notelp'] = this.notelp;
    data['kota'] = this.kota;
    data['kecamatan'] = this.kecamatan;
    data['provinsi'] = this.provinsi;
    data['alamat'] = this.alamat;
    data['idtt'] = this.idtt;
    data['segment'] = this.segment;
    data['kodereferral'] = this.kodereferral;
    return data;
  }

  static Future<insertCustResponse> connectionAPI(
      String email, String telp, String name, String kota) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.insertCust;
      insertCustRequest request = insertCustRequest();
      request.token = Constants.apiToken;
      request.cabang = Constants.branch;
      request.email = email;
      request.custName = name;
      request.notelp = telp;
      request.kota=kota;
      request.kecamatan = "";
      request.provinsi="";
      request.alamat="";
      request.idtt="";
      request.segment="";
      request.kodereferral="";

      dio.options.headers = {};
      dio.options.contentType = "application/x-www-form-urlencoded";
      print("URL: $URL");
      print(
          "${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());
      print(response.data);

      return insertCustResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

}