class loginOTP2Response {
  String? status;
  String? message;
  DataLogin? data;

  loginOTP2Response({this.status, this.message, this.data});

  loginOTP2Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new DataLogin.fromJson(json['data']) : null;
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

class DataLogin {
  String? userID;
  String? email;
  String? namaLengkap;
  String? gender;
  String? alamat;
  String? noHP;
  String? tglLahir;
  String? kota;
  String? zipCode;
  String? aktif;
  String? idDoku;
  String? whatsAppNumber;
  String? transactionPIN;
  String? cekLogin;
  String? deviceLoyalty;
  String? createDate;
  String? pKP;
  String? segment;
  String? namaSegment;
  String? provinsi;
  String? noKTP;
  String? fotoOrangKTP;
  String? fotoKTP;
  String? tempatLahir;
  String? jenisLoyalty;

  DataLogin(
      {this.userID,
        this.email,
        this.namaLengkap,
        this.gender,
        this.alamat,
        this.noHP,
        this.tglLahir,
        this.kota,
        this.zipCode,
        this.aktif,
        this.idDoku,
        this.whatsAppNumber,
        this.transactionPIN,
        this.cekLogin,
        this.deviceLoyalty,
        this.createDate,
        this.pKP,
        this.segment,
        this.namaSegment,
        this.provinsi,
        this.noKTP,
        this.fotoOrangKTP,
        this.fotoKTP,
        this.tempatLahir,
        this.jenisLoyalty});

  DataLogin.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    email = json['Email'];
    namaLengkap = json['NamaLengkap'];
    gender = json['Gender'];
    alamat = json['Alamat'];
    noHP = json['NoHP'];
    tglLahir = json['TglLahir'];
    kota = json['Kota'];
    zipCode = json['ZipCode'];
    aktif = json['Aktif'];
    idDoku = json['IdDoku'];
    whatsAppNumber = json['WhatsAppNumber'];
    transactionPIN = json['TransactionPIN'];
    cekLogin = json['CekLogin'];
    deviceLoyalty = json['DeviceLoyalty'];
    createDate = json['CreateDate'];
    pKP = json['PKP'];
    segment = json['Segment'];
    namaSegment = json['NamaSegment'];
    provinsi = json['Provinsi'];
    noKTP = json['NoKTP'];
    fotoOrangKTP = json['FotoOrangKTP'];
    fotoKTP = json['FotoKTP'];
    tempatLahir = json['TempatLahir'];
    jenisLoyalty = json['JenisLoyalty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['Email'] = this.email;
    data['NamaLengkap'] = this.namaLengkap;
    data['Gender'] = this.gender;
    data['Alamat'] = this.alamat;
    data['NoHP'] = this.noHP;
    data['TglLahir'] = this.tglLahir;
    data['Kota'] = this.kota;
    data['ZipCode'] = this.zipCode;
    data['Aktif'] = this.aktif;
    data['IdDoku'] = this.idDoku;
    data['WhatsAppNumber'] = this.whatsAppNumber;
    data['TransactionPIN'] = this.transactionPIN;
    data['CekLogin'] = this.cekLogin;
    data['DeviceLoyalty'] = this.deviceLoyalty;
    data['CreateDate'] = this.createDate;
    data['PKP'] = this.pKP;
    data['Segment'] = this.segment;
    data['NamaSegment'] = this.namaSegment;
    data['Provinsi'] = this.provinsi;
    data['NoKTP'] = this.noKTP;
    data['FotoOrangKTP'] = this.fotoOrangKTP;
    data['FotoKTP'] = this.fotoKTP;
    data['TempatLahir'] = this.tempatLahir;
    data['JenisLoyalty'] = this.jenisLoyalty;
    return data;
  }
}