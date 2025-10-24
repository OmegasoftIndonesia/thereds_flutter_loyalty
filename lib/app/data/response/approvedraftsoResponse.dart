class approvedraftsoResponse {
  String? status;
  String? message;

  approvedraftsoResponse({this.status, this.message});

  approvedraftsoResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}