class getGameListResponse {
  String? status;
  String? message;
  List<Data>? data;

  getGameListResponse({this.status, this.message, this.data});

  getGameListResponse.fromJson(Map<String, dynamic> json) {
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
  String? branch;
  String? judul;
  String? gambar;
  String? tglGambar;
  String? deskripsi;
  String? aktif;
  String? createBy;
  String? createDate;
  String? operator;
  String? tglEntry;

  Data(
      {this.kode,
        this.branch,
        this.judul,
        this.gambar,
        this.tglGambar,
        this.deskripsi,
        this.aktif,
        this.createBy,
        this.createDate,
        this.operator,
        this.tglEntry});

  Data.fromJson(Map<String, dynamic> json) {
    kode = json['Kode'];
    branch = json['Branch'];
    judul = json['Judul'];
    gambar = json['Gambar'];
    tglGambar = json['TglGambar'];
    deskripsi = json['Deskripsi'];
    aktif = json['Aktif'];
    createBy = json['CreateBy'];
    createDate = json['CreateDate'];
    operator = json['Operator'];
    tglEntry = json['TglEntry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Kode'] = this.kode;
    data['Branch'] = this.branch;
    data['Judul'] = this.judul;
    data['Gambar'] = this.gambar;
    data['TglGambar'] = this.tglGambar;
    data['Deskripsi'] = this.deskripsi;
    data['Aktif'] = this.aktif;
    data['CreateBy'] = this.createBy;
    data['CreateDate'] = this.createDate;
    data['Operator'] = this.operator;
    data['TglEntry'] = this.tglEntry;
    return data;
  }
}