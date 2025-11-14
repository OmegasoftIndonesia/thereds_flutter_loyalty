class getlistorderResponse {
  String? total;
  String? batal;
  String? closed;
  String? makeMyOrder;
  String? kodenota;
  String? createDate;
  String? totalBayar;
  String? tgl;
  String? tglKirimPreOrder;
  String? ketStatus;
  String? kodeNotaJual;
  String? noRentObject;
  String? alasanBatal;
  String? totalKredit;
  String? bankKredit;
  String? totalTransfer;
  String? bankTransfer;
  String? kodeUnik;
  String? custTelp;
  String? isBooking;
  String? jamMulai;
  String? jamAkhir;
  String? ketRentObject;
  String? ketTipeRentObject;
  String? durasiMenit;
  String? custName;

  getlistorderResponse(
      {this.total,
        this.batal,
        this.closed,
        this.makeMyOrder,
        this.kodenota,
        this.createDate,
        this.totalBayar,
        this.tgl,
        this.tglKirimPreOrder,
        this.ketStatus,
        this.kodeNotaJual,
        this.noRentObject,
        this.alasanBatal,
        this.totalKredit,
        this.bankKredit,
        this.totalTransfer,
        this.bankTransfer,
        this.kodeUnik,
        this.custTelp,
        this.isBooking,
        this.jamMulai,
        this.jamAkhir,
        this.ketRentObject,
        this.ketTipeRentObject,
        this.durasiMenit,
        this.custName});

  getlistorderResponse.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    batal = json['Batal'];
    closed = json['Closed'];
    makeMyOrder = json['MakeMyOrder'];
    kodenota = json['Kodenota'];
    createDate = json['CreateDate'];
    totalBayar = json['TotalBayar'];
    tgl = json['Tgl'];
    tglKirimPreOrder = json['TglKirimPreOrder'];
    ketStatus = json['KetStatus'];
    kodeNotaJual = json['KodeNotaJual'];
    noRentObject = json['NoRentObject'];
    alasanBatal = json['AlasanBatal'];
    totalKredit = json['TotalKredit'];
    bankKredit = json['BankKredit'];
    totalTransfer = json['TotalTransfer'];
    bankTransfer = json['BankTransfer'];
    kodeUnik = json['KodeUnik'];
    custTelp = json['CustTelp'];
    isBooking = json['IsBooking'];
    jamMulai = json['JamMulai'];
    jamAkhir = json['JamAkhir'];
    ketRentObject = json['KetRentObject'];
    ketTipeRentObject = json['KetTipeRentObject'];
    durasiMenit = json['DurasiMenit'];
    custName = json['CustName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total'] = this.total;
    data['Batal'] = this.batal;
    data['Closed'] = this.closed;
    data['MakeMyOrder'] = this.makeMyOrder;
    data['Kodenota'] = this.kodenota;
    data['CreateDate'] = this.createDate;
    data['TotalBayar'] = this.totalBayar;
    data['Tgl'] = this.tgl;
    data['TglKirimPreOrder'] = this.tglKirimPreOrder;
    data['KetStatus'] = this.ketStatus;
    data['KodeNotaJual'] = this.kodeNotaJual;
    data['NoRentObject'] = this.noRentObject;
    data['AlasanBatal'] = this.alasanBatal;
    data['TotalKredit'] = this.totalKredit;
    data['BankKredit'] = this.bankKredit;
    data['TotalTransfer'] = this.totalTransfer;
    data['BankTransfer'] = this.bankTransfer;
    data['KodeUnik'] = this.kodeUnik;
    data['CustTelp'] = this.custTelp;
    data['IsBooking'] = this.isBooking;
    data['JamMulai'] = this.jamMulai;
    data['JamAkhir'] = this.jamAkhir;
    data['KetRentObject'] = this.ketRentObject;
    data['KetTipeRentObject'] = this.ketTipeRentObject;
    data['DurasiMenit'] = this.durasiMenit;
    data['CustName'] = this.custName;
    return data;
  }
  List<getlistorderResponse> parseResponse(List<dynamic> jsonList) {
    return jsonList.map((e) => getlistorderResponse.fromJson(e)).toList();
  }
}

