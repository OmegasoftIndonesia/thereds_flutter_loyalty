class paymenttypeResponse {
  String? status;
  String? message;
  List<DataPayType>? data;

  paymenttypeResponse({this.status, this.message, this.data});

  paymenttypeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataPayType>[];
      json['data'].forEach((v) {
        data!.add(new DataPayType.fromJson(v));
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

class DataPayType {
  String? jenis;
  String? payParam;
  String? noPerkiraan;

  DataPayType({this.jenis, this.payParam, this.noPerkiraan});

  DataPayType.fromJson(Map<String, dynamic> json) {
    jenis = json['Jenis'];
    payParam = json['PayParam'];
    noPerkiraan = json['NoPerkiraan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Jenis'] = this.jenis;
    data['PayParam'] = this.payParam;
    data['NoPerkiraan'] = this.noPerkiraan;
    return data;
  }
}