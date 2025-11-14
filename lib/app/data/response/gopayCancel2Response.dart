class gopayCancel2Response {
  int? statusCode;
  String? message;

  gopayCancel2Response({this.statusCode, this.message});

  gopayCancel2Response.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}