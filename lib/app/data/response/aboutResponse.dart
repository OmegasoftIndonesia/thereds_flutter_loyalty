class aboutResponse {
  String? alamat;
  String? notelp;
  String? wa;
  String? longlat;
  String? noWANotif1;
  String? noWANotif2;
  String? loyaltyName;
  String? loyaltyVersion;
  String? loyaltyVersionCode;
  String? androidID;
  String? iOSID;
  String? pajakPOSRetail;
  String? pajakPOSResto;
  String? jenisPekerjaanJasaKirim;
  String? aPIKeyMutasiBankcoid;
  String? companyCodeBCA;
  String? isPPN;
  String? priceListIncPPN;

  aboutResponse(
      {this.alamat,
        this.notelp,
        this.wa,
        this.longlat,
        this.noWANotif1,
        this.noWANotif2,
        this.loyaltyName,
        this.loyaltyVersion,
        this.loyaltyVersionCode,
        this.androidID,
        this.iOSID,
        this.pajakPOSRetail,
        this.pajakPOSResto,
        this.jenisPekerjaanJasaKirim,
        this.aPIKeyMutasiBankcoid,
        this.companyCodeBCA,
        this.isPPN,
        this.priceListIncPPN});

  aboutResponse.fromJson(Map<String, dynamic> json) {
    alamat = json['alamat'];
    notelp = json['notelp'];
    wa = json['wa'];
    longlat = json['longlat'];
    noWANotif1 = json['NoWANotif1'];
    noWANotif2 = json['NoWANotif2'];
    loyaltyName = json['LoyaltyName'];
    loyaltyVersion = json['LoyaltyVersion'];
    loyaltyVersionCode = json['LoyaltyVersionCode'];
    androidID = json['AndroidID'];
    iOSID = json['iOSID'];
    pajakPOSRetail = json['PajakPOSRetail'];
    pajakPOSResto = json['PajakPOSResto'];
    jenisPekerjaanJasaKirim = json['JenisPekerjaanJasaKirim'];
    aPIKeyMutasiBankcoid = json['APIKeyMutasiBankcoid'];
    companyCodeBCA = json['CompanyCodeBCA'];
    isPPN = json['IsPPN'];
    priceListIncPPN = json['PriceListIncPPN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alamat'] = this.alamat;
    data['notelp'] = this.notelp;
    data['wa'] = this.wa;
    data['longlat'] = this.longlat;
    data['NoWANotif1'] = this.noWANotif1;
    data['NoWANotif2'] = this.noWANotif2;
    data['LoyaltyName'] = this.loyaltyName;
    data['LoyaltyVersion'] = this.loyaltyVersion;
    data['LoyaltyVersionCode'] = this.loyaltyVersionCode;
    data['AndroidID'] = this.androidID;
    data['iOSID'] = this.iOSID;
    data['PajakPOSRetail'] = this.pajakPOSRetail;
    data['PajakPOSResto'] = this.pajakPOSResto;
    data['JenisPekerjaanJasaKirim'] = this.jenisPekerjaanJasaKirim;
    data['APIKeyMutasiBankcoid'] = this.aPIKeyMutasiBankcoid;
    data['CompanyCodeBCA'] = this.companyCodeBCA;
    data['IsPPN'] = this.isPPN;
    data['PriceListIncPPN'] = this.priceListIncPPN;
    return data;
  }
}