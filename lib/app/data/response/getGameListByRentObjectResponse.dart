class getGameListByRentObjectResponse {
  String? status;
  String? message;
  List<DataGame>? data;

  getGameListByRentObjectResponse({this.status, this.message, this.data});

  getGameListByRentObjectResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataGame>[];
      json['data'].forEach((v) {
        data!.add(new DataGame.fromJson(v));
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

class DataGame {
  String? kode;
  String? judul;
  String? gambar;
  String? tglGambar;
  String? deskripsi;
  String? aktif;
  String? createBy;
  String? createDate;
  String? operator;
  String? tglEntry;
  String? noRentObject;

  DataGame(
      {this.kode,
        this.judul,
        this.gambar,
        this.tglGambar,
        this.deskripsi,
        this.aktif,
        this.createBy,
        this.createDate,
        this.operator,
        this.tglEntry,
        this.noRentObject});

  DataGame.fromJson(Map<String, dynamic> json) {
    kode = json['Kode'];
    judul = json['Judul'];
    gambar = json['Gambar'];
    tglGambar = json['TglGambar'];
    deskripsi = json['Deskripsi'];
    aktif = json['Aktif'];
    createBy = json['CreateBy'];
    createDate = json['CreateDate'];
    operator = json['Operator'];
    tglEntry = json['TglEntry'];
    noRentObject = json['NoRentObject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Kode'] = this.kode;
    data['Judul'] = this.judul;
    data['Gambar'] = this.gambar;
    data['TglGambar'] = this.tglGambar;
    data['Deskripsi'] = this.deskripsi;
    data['Aktif'] = this.aktif;
    data['CreateBy'] = this.createBy;
    data['CreateDate'] = this.createDate;
    data['Operator'] = this.operator;
    data['TglEntry'] = this.tglEntry;
    data['NoRentObject'] = this.noRentObject;
    return data;
  }
}