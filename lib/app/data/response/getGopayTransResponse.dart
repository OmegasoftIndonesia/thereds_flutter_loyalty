class getGopayTransResponse {
  int? statusCode;
  String? message;
  Data? data;

  getGopayTransResponse({this.statusCode, this.message, this.data});

  getGopayTransResponse.fromJson(Map<String, dynamic> json) {
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
  String? transactionStatus;
  String? additionalInformation;

  Data(
      {this.transactionCode,
        this.transactionStatus,
        this.additionalInformation});

  Data.fromJson(Map<String, dynamic> json) {
    transactionCode = json['transaction_code'];
    transactionStatus = json['transaction_status'];
    additionalInformation = json['additional_information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_code'] = this.transactionCode;
    data['transaction_status'] = this.transactionStatus;
    data['additional_information'] = this.additionalInformation;
    return data;
  }
}