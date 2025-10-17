class ListRentObjectResponse {
  String? status;
  String? message;
  List<Data>? data;

  ListRentObjectResponse({this.status, this.message, this.data});

  ListRentObjectResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? kode;
  String? noRentObject;
  String? grup;
  String? kapasitas;
  String? kodeAcakSelfOrder;
  String? minOrder;
  String? jamMulai;
  String? jamAkhir;
  String? isUsed;
  String? minOrderWeekend;

  Data(
      {this.kode,
        this.noRentObject,
        this.grup,
        this.kapasitas,
        this.kodeAcakSelfOrder,
        this.minOrder,
        this.jamMulai,
        this.jamAkhir,
        this.isUsed,
        this.minOrderWeekend});

  Data.fromJson(Map<String, dynamic> json) {
    kode = json['Kode'];
    noRentObject = json['NoRentObject'];
    grup = json['Grup'];
    kapasitas = json['Kapasitas'];
    kodeAcakSelfOrder = json['KodeAcakSelfOrder'];
    minOrder = json['MinOrder'];
    jamMulai = json['JamMulai'];
    jamAkhir = json['JamAkhir'];
    isUsed = json['IsUsed'];
    minOrderWeekend = json['MinOrderWeekend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Kode'] = this.kode;
    data['NoRentObject'] = this.noRentObject;
    data['Grup'] = this.grup;
    data['Kapasitas'] = this.kapasitas;
    data['KodeAcakSelfOrder'] = this.kodeAcakSelfOrder;
    data['MinOrder'] = this.minOrder;
    data['JamMulai'] = this.jamMulai;
    data['JamAkhir'] = this.jamAkhir;
    data['IsUsed'] = this.isUsed;
    data['MinOrderWeekend'] = this.minOrderWeekend;
    return data;
  }
}