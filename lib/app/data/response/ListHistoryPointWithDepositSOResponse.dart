class ListHistoryPointWithDepositSOResponse {
  String? status;
  String? message;
  List<DataPoint>? data;

  ListHistoryPointWithDepositSOResponse({this.status, this.message, this.data});

  ListHistoryPointWithDepositSOResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataPoint>[];
      json['data'].forEach((v) {
        data!.add(new DataPoint.fromJson(v));
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

class DataPoint {
  String? urutan;
  String? module;
  String? tgl;
  String? kodeNota;
  String? keterangan;
  String? debet;
  String? kredit;
  String? balance;

  DataPoint(
      {this.urutan,
        this.module,
        this.tgl,
        this.kodeNota,
        this.keterangan,
        this.debet,
        this.kredit,
        this.balance});

  DataPoint.fromJson(Map<String, dynamic> json) {
    urutan = json['Urutan'];
    module = json['Module'];
    tgl = json['Tgl'];
    kodeNota = json['KodeNota'];
    keterangan = json['Keterangan'];
    debet = json['Debet'];
    kredit = json['Kredit'];
    balance = json['Balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Urutan'] = this.urutan;
    data['Module'] = this.module;
    data['Tgl'] = this.tgl;
    data['KodeNota'] = this.kodeNota;
    data['Keterangan'] = this.keterangan;
    data['Debet'] = this.debet;
    data['Kredit'] = this.kredit;
    data['Balance'] = this.balance;
    return data;
  }
}