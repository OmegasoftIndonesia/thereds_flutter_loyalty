class insertpiutangdraftsoResponse {
  String? status;
  String? message;
  String? kodenota;

  insertpiutangdraftsoResponse({this.status, this.message, this.kodenota});

  insertpiutangdraftsoResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    kodenota = json['kodenota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['kodenota'] = this.kodenota;
    return data;
  }
}