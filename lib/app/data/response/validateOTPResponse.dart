class validateOTPResponse {
  bool? status;
  String? message;
  Data? data;

  validateOTPResponse({this.status, this.message, this.data});

  validateOTPResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Meta? meta;
  int? status;
  bool? success;

  Data({this.meta, this.status, this.success});

  Data.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    status = json['status'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['status'] = this.status;
    data['success'] = this.success;
    return data;
  }
}

class Meta {
  double? processTime;

  Meta({this.processTime});

  Meta.fromJson(Map<String, dynamic> json) {
    processTime = json['process_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['process_time'] = this.processTime;
    return data;
  }
}