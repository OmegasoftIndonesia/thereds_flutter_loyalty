class listNotifikasiResponse {
  String? status;
  String? message;
  List<DataNotifikasi>? data;

  listNotifikasiResponse({this.status, this.message, this.data});

  listNotifikasiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataNotifikasi>[];
      json['data'].forEach((v) {
        data!.add(new DataNotifikasi.fromJson(v));
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

class DataNotifikasi {
  String? kode;
  String? judul;
  String? keterangan;
  String? branch;
  String? cust;
  String? kodeEvent;
  String? createDate;
  String? isRead;

  DataNotifikasi(
      {this.kode,
        this.judul,
        this.keterangan,
        this.branch,
        this.cust,
        this.kodeEvent,
        this.createDate,
        this.isRead});

  DataNotifikasi.fromJson(Map<String, dynamic> json) {
    kode = json['Kode'];
    judul = json['Judul'];
    keterangan = json['Keterangan'];
    branch = json['Branch'];
    cust = json['Cust'];
    kodeEvent = json['KodeEvent'];
    createDate = json['CreateDate'];
    isRead = json['IsRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Kode'] = this.kode;
    data['Judul'] = this.judul;
    data['Keterangan'] = this.keterangan;
    data['Branch'] = this.branch;
    data['Cust'] = this.cust;
    data['KodeEvent'] = this.kodeEvent;
    data['CreateDate'] = this.createDate;
    data['IsRead'] = this.isRead;
    return data;
  }
}