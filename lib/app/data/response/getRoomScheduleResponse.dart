class getRoomScheduleResponse {
  String? status;
  String? message;
  List<Data>? data;

  getRoomScheduleResponse({this.status, this.message, this.data});

  getRoomScheduleResponse.fromJson(Map<String, dynamic> json) {
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
  String? jam;
  String? statusBooking;

  Data({this.jam, this.statusBooking});

  Data.fromJson(Map<String, dynamic> json) {
    jam = json['Jam'];
    statusBooking = json['StatusBooking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Jam'] = this.jam;
    data['StatusBooking'] = this.statusBooking;
    return data;
  }
}