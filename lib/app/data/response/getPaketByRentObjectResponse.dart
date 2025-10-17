class getPaketByRentObjectResponse {
  String? status;
  String? message;
  List<Data>? data;

  getPaketByRentObjectResponse({this.status, this.message, this.data});

  getPaketByRentObjectResponse.fromJson(Map<String, dynamic> json) {
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
  String? keterangan;
  String? minDuration;
  String? minNominal;
  String? minDurationType;
  String? duration;
  String? nominal;
  String? durationType;
  String? isContinued;
  String? isMinMaxHour;
  String? minHour;
  String? maxHour;
  String? isPreOrder;
  String? masaBerlaku;
  String? validDay;

  Data(
      {this.kode,
        this.keterangan,
        this.minDuration,
        this.minNominal,
        this.minDurationType,
        this.duration,
        this.nominal,
        this.durationType,
        this.isContinued,
        this.isMinMaxHour,
        this.minHour,
        this.maxHour,
        this.isPreOrder,
        this.masaBerlaku,
        this.validDay});

  Data.fromJson(Map<String, dynamic> json) {
    kode = json['Kode'];
    keterangan = json['Keterangan'];
    minDuration = json['MinDuration'];
    minNominal = json['MinNominal'];
    minDurationType = json['MinDurationType'];
    duration = json['Duration'];
    nominal = json['Nominal'];
    durationType = json['DurationType'];
    isContinued = json['IsContinued'];
    isMinMaxHour = json['IsMinMaxHour'];
    minHour = json['MinHour'];
    maxHour = json['MaxHour'];
    isPreOrder = json['IsPreOrder'];
    masaBerlaku = json['MasaBerlaku'];
    validDay = json['ValidDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Kode'] = this.kode;
    data['Keterangan'] = this.keterangan;
    data['MinDuration'] = this.minDuration;
    data['MinNominal'] = this.minNominal;
    data['MinDurationType'] = this.minDurationType;
    data['Duration'] = this.duration;
    data['Nominal'] = this.nominal;
    data['DurationType'] = this.durationType;
    data['IsContinued'] = this.isContinued;
    data['IsMinMaxHour'] = this.isMinMaxHour;
    data['MinHour'] = this.minHour;
    data['MaxHour'] = this.maxHour;
    data['IsPreOrder'] = this.isPreOrder;
    data['MasaBerlaku'] = this.masaBerlaku;
    data['ValidDay'] = this.validDay;
    return data;
  }
}