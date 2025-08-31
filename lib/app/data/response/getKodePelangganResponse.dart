class getKodePelangganResponse {
  String? kode;

  getKodePelangganResponse({this.kode});

  getKodePelangganResponse.fromJson(Map<String, dynamic> json) {
    kode = json['Kode'];
  }

  List<getKodePelangganResponse> parseKodeResponse(List<dynamic> jsonList) {
    return jsonList.map((e) => getKodePelangganResponse.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Kode'] = this.kode;
    return data;
  }
}