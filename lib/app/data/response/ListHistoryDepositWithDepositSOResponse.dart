class ListHistoryDepositWithDepositSOResponse {
  String? status;
  String? message;
  List<DataSaldo>? data;

  ListHistoryDepositWithDepositSOResponse(
      {this.status, this.message, this.data});

  ListHistoryDepositWithDepositSOResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataSaldo>[];
      json['data'].forEach((v) {
        data!.add(new DataSaldo.fromJson(v));
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

class DataSaldo {
  String? urutan;
  String? module;
  String? tgl;
  String? kodeNota;
  String? keterangan;
  String? depositDebet;
  String? depositKredit;
  String? depositBalance;

  DataSaldo(
      {this.urutan,
        this.module,
        this.tgl,
        this.kodeNota,
        this.keterangan,
        this.depositDebet,
        this.depositKredit,
        this.depositBalance});

  DataSaldo.fromJson(Map<String, dynamic> json) {
    urutan = json['Urutan'];
    module = json['Module'];
    tgl = json['Tgl'];
    kodeNota = json['KodeNota'];
    keterangan = json['Keterangan'];
    depositDebet = json['DepositDebet'];
    depositKredit = json['DepositKredit'];
    depositBalance = json['DepositBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Urutan'] = this.urutan;
    data['Module'] = this.module;
    data['Tgl'] = this.tgl;
    data['KodeNota'] = this.kodeNota;
    data['Keterangan'] = this.keterangan;
    data['DepositDebet'] = this.depositDebet;
    data['DepositKredit'] = this.depositKredit;
    data['DepositBalance'] = this.depositBalance;
    return data;
  }
}