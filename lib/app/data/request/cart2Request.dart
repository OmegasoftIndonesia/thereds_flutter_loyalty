import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:thereds_flutter_loyalty/app/data/Constants.dart';
import 'package:thereds_flutter_loyalty/app/data/response/cart2Response.dart';
import 'package:thereds_flutter_loyalty/app/util/injector.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../url.dart';

class cart2Request {
  String? cabang;
  int? amount;
  String? email;
  String? custName;
  String? notelp;
  String? note;
  int? ppn;
  String? kota;
  String? kecamatan;
  String? provinsi;
  String? alamat;
  String? lt;
  String? lg;
  String? idtt;
  String? norentobject;
  String? jammulai;
  String? jamakhir;
  int? isbooking;
  int? potongan;
  Null? novoucher;
  String? channel;
  int? makemyorder;
  String? kodeunik;
  String? deviceversion;
  String? satuancustom;
  String? tgltransaksi;
  String? kodepos;
  String? inkodecust;
  int? jmltamu;
  int? ongkosKirim;
  String? jasaKirim;
  String? noteKirim;
  String? tipeRentObject;
  String? jasaTipeRentObject;
  int? depositSO;
  String? bentukDanaDepositSO;
  List<Detail>? detail;

  cart2Request({
    this.cabang,
    this.amount,
    this.email,
    this.custName,
    this.notelp,
    this.note,
    this.ppn,
    this.kota,
    this.kecamatan,
    this.provinsi,
    this.alamat,
    this.lt,
    this.lg,
    this.idtt,
    this.norentobject,
    this.jammulai,
    this.jamakhir,
    this.isbooking,
    this.potongan,
    this.novoucher,
    this.channel,
    this.makemyorder,
    this.kodeunik,
    this.deviceversion,
    this.satuancustom,
    this.tgltransaksi,
    this.kodepos,
    this.inkodecust,
    this.jmltamu,
    this.ongkosKirim,
    this.jasaKirim,
    this.noteKirim,
    this.tipeRentObject,
    this.jasaTipeRentObject,
    this.depositSO,
    this.bentukDanaDepositSO,
    this.detail,
  });

  cart2Request.fromJson(Map<String, dynamic> json) {
    cabang = json['cabang'];
    amount = json['amount'];
    email = json['email'];
    custName = json['cust_name'];
    notelp = json['notelp'];
    note = json['note'];
    ppn = json['ppn'];
    kota = json['kota'];
    kecamatan = json['kecamatan'];
    provinsi = json['provinsi'];
    alamat = json['alamat'];
    lt = json['lt'];
    lg = json['lg'];
    idtt = json['idtt'];
    norentobject = json['norentobject'];
    jammulai = json['jammulai'];
    jamakhir = json['jamakhir'];
    isbooking = json['isbooking'];
    potongan = json['potongan'];
    novoucher = json['novoucher'];
    channel = json['channel'];
    makemyorder = json['makemyorder'];
    kodeunik = json['kodeunik'];
    deviceversion = json['deviceversion'];
    satuancustom = json['satuancustom'];
    tgltransaksi = json['tgltransaksi'];
    kodepos = json['kodepos'];
    inkodecust = json['inkodecust'];
    jmltamu = json['jmltamu'];
    ongkosKirim = json['OngkosKirim'];
    jasaKirim = json['JasaKirim'];
    noteKirim = json['NoteKirim'];
    tipeRentObject = json['TipeRentObject'];
    jasaTipeRentObject = json['JasaTipeRentObject'];
    depositSO = json['DepositSO'];
    bentukDanaDepositSO = json['BentukDanaDepositSO'];
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(new Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cabang'] = this.cabang;
    data['amount'] = this.amount;
    data['email'] = this.email;
    data['cust_name'] = this.custName;
    data['notelp'] = this.notelp;
    data['note'] = this.note;
    data['ppn'] = this.ppn;
    data['kota'] = this.kota;
    data['kecamatan'] = this.kecamatan;
    data['provinsi'] = this.provinsi;
    data['alamat'] = this.alamat;
    data['lt'] = this.lt;
    data['lg'] = this.lg;
    data['idtt'] = this.idtt;
    data['norentobject'] = this.norentobject;
    data['jammulai'] = this.jammulai;
    data['jamakhir'] = this.jamakhir;
    data['isbooking'] = this.isbooking;
    data['potongan'] = this.potongan;
    data['novoucher'] = this.novoucher;
    data['channel'] = this.channel;
    data['makemyorder'] = this.makemyorder;
    data['kodeunik'] = this.kodeunik;
    data['deviceversion'] = this.deviceversion;
    data['satuancustom'] = this.satuancustom;
    data['tgltransaksi'] = this.tgltransaksi;
    data['kodepos'] = this.kodepos;
    data['inkodecust'] = this.inkodecust;
    data['jmltamu'] = this.jmltamu;
    data['OngkosKirim'] = this.ongkosKirim;
    data['JasaKirim'] = this.jasaKirim;
    data['NoteKirim'] = this.noteKirim;
    data['TipeRentObject'] = this.tipeRentObject;
    data['JasaTipeRentObject'] = this.jasaTipeRentObject;
    data['DepositSO'] = this.depositSO;
    data['BentukDanaDepositSO'] = this.bentukDanaDepositSO;
    if (this.detail != null) {
      data['detail'] = this.detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<cart2Response> connectionAPI(
    Detail detailItem,
    int totalamount,
    String noRent,
    String kodePaket,
    String jamMulai,
    String jamAkhir,
    String tglBooking,
    String kodeJasa,
      String bentukDana
  ) async {
    Dio dio = Dio();

    try {
      String URL = URLAPI.cart2;
      cart2Request request = cart2Request();

      request.cabang = Constants.branch;
      request.amount = totalamount;
      request.email = util.getString(PreferencesUtil.email);
      request.custName = util.getString(PreferencesUtil.name);
      request.notelp = util.getString(PreferencesUtil.phone);
      request.note = "";
      request.ppn = double.parse(util.getString(PreferencesUtil.ppn)!).toInt();
      request.kota = util.getString(PreferencesUtil.kota);
      request.kecamatan = "";
      request.provinsi = "";
      request.alamat = "";
      request.lt = "";
      request.lg = "";
      request.idtt = "";
      request.norentobject = noRent;
      request.jammulai = jamMulai;
      request.jamakhir = jamAkhir;
      request.isbooking = 1;
      request.potongan = 0;
      request.novoucher = null;
      request.channel = "Loyalty Apps";
      request.makemyorder = 1;
      request.kodeunik = "";
      request.deviceversion =
          "${(Platform.isAndroid)
              ? "Android"
              : (Platform.isIOS)
              ? "iOS"
              : ""} - ${Constants.version}";
      request.satuancustom = "PCS";
      request.tgltransaksi = tglBooking;
      request.kodepos = "";
      request.inkodecust = util.getString(PreferencesUtil.kodePelanggan);
      request.jmltamu = 1;
      request.ongkosKirim = 0;
      request.jasaKirim = null;
      request.noteKirim = null;
      request.tipeRentObject = kodePaket;
      request.jasaTipeRentObject = kodeJasa;
      request.depositSO = totalamount;
      request.bentukDanaDepositSO = bentukDana;
      request.detail = [detailItem];

      dio.options.headers = {};
      dio.options.contentType = "application/json";
      print("URL: $URL");
      print("${request.toJson()}");
      Response response = await dio.post(URL, data: request.toJson());

      print(response.data);

      return cart2Response.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

class Detail {
  String? productUid;
  String? note;
  int? quantity;
  int? amount;
  int? disc2;
  int? disc3;
  int? discvaluepost;
  String? tipe;
  String? satuan;
  String? paket;
  int? jmlpaket;
  int? rasio;

  Detail({
    this.productUid,
    this.note,
    this.quantity,
    this.amount,
    this.disc2,
    this.disc3,
    this.discvaluepost,
    this.tipe,
    this.satuan,
    this.paket,
    this.jmlpaket,
    this.rasio,
  });

  Detail.fromJson(Map<String, dynamic> json) {
    productUid = json['product_uid'];
    note = json['note'];
    quantity = json['quantity'];
    amount = json['amount'];
    disc2 = json['disc2'];
    disc3 = json['disc3'];
    discvaluepost = json['discvaluepost'];
    tipe = json['tipe'];
    satuan = json['satuan'];
    paket = json['paket'];
    jmlpaket = json['jmlpaket'];
    rasio = json['rasio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_uid'] = this.productUid;
    data['note'] = this.note;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['disc2'] = this.disc2;
    data['disc3'] = this.disc3;
    data['discvaluepost'] = this.discvaluepost;
    data['tipe'] = this.tipe;
    data['satuan'] = this.satuan;
    data['paket'] = this.paket;
    data['jmlpaket'] = this.jmlpaket;
    data['rasio'] = this.rasio;
    return data;
  }
}
