class createGopayResponse {
  int? statusCode;
  String? message;
  Data? data;

  createGopayResponse({this.statusCode, this.message, this.data});

  createGopayResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? transactionCode;
  String? urlQrcode;
  String? urlQrcodeRaw;
  String? transactionStatus;

  Data(
      {this.transactionCode,
        this.urlQrcode,
        this.urlQrcodeRaw,
        this.transactionStatus});

  Data.fromJson(Map<String, dynamic> json) {
    transactionCode = json['transaction_code'];
    urlQrcode = json['url_qrcode'];
    urlQrcodeRaw = json['url_qrcode_raw'];
    transactionStatus = json['transaction_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_code'] = this.transactionCode;
    data['url_qrcode'] = this.urlQrcode;
    data['url_qrcode_raw'] = this.urlQrcodeRaw;
    data['transaction_status'] = this.transactionStatus;
    return data;
  }
}