class detaillistorderResponse {
  String? nama;
  String? alamatKirim;
  String? notlp;
  String? noRentObject;
  String? latitude;
  String? longitude;
  String? kirimVia;
  String? ongkosKirim;
  String? noResi;
  String? total;
  String? disc;
  String? pPN;
  String? totalBayar;
  String? totalStok;
  String? ketNoRentObject;
  String? isBooking;
  String? tgl;
  String? jamMulai;
  String? jamAkhir;
  String? jasaPelayanan;
  List<Detail>? detail;

  detaillistorderResponse(
      {this.nama,
        this.alamatKirim,
        this.notlp,
        this.noRentObject,
        this.latitude,
        this.longitude,
        this.kirimVia,
        this.ongkosKirim,
        this.noResi,
        this.total,
        this.disc,
        this.pPN,
        this.totalBayar,
        this.totalStok,
        this.ketNoRentObject,
        this.isBooking,
        this.tgl,
        this.jamMulai,
        this.jamAkhir,
        this.jasaPelayanan,
        this.detail});

  detaillistorderResponse.fromJson(Map<String, dynamic> json) {
    nama = json['Nama'];
    alamatKirim = json['AlamatKirim'];
    notlp = json['Notlp'];
    noRentObject = json['NoRentObject'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    kirimVia = json['KirimVia'];
    ongkosKirim = json['OngkosKirim'];
    noResi = json['NoResi'];
    total = json['Total'];
    disc = json['Disc'];
    pPN = json['PPN'];
    totalBayar = json['TotalBayar'];
    totalStok = json['TotalStok'];
    ketNoRentObject = json['KetNoRentObject'];
    isBooking = json['IsBooking'];
    tgl = json['Tgl'];
    jamMulai = json['JamMulai'];
    jamAkhir = json['JamAkhir'];
    jasaPelayanan = json['JasaPelayanan'];
    if (json['Detail'] != null) {
      detail = <Detail>[];
      json['Detail'].forEach((v) {
        detail!.add(new Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nama'] = this.nama;
    data['AlamatKirim'] = this.alamatKirim;
    data['Notlp'] = this.notlp;
    data['NoRentObject'] = this.noRentObject;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['KirimVia'] = this.kirimVia;
    data['OngkosKirim'] = this.ongkosKirim;
    data['NoResi'] = this.noResi;
    data['Total'] = this.total;
    data['Disc'] = this.disc;
    data['PPN'] = this.pPN;
    data['TotalBayar'] = this.totalBayar;
    data['TotalStok'] = this.totalStok;
    data['KetNoRentObject'] = this.ketNoRentObject;
    data['IsBooking'] = this.isBooking;
    data['Tgl'] = this.tgl;
    data['JamMulai'] = this.jamMulai;
    data['JamAkhir'] = this.jamAkhir;
    data['JasaPelayanan'] = this.jasaPelayanan;
    if (this.detail != null) {
      data['Detail'] = this.detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Detail {
  String? kodenota;
  String? kodemenu;
  String? namamenu;
  String? groupModifier;
  String? harga;
  String? gambar;
  String? modifier;
  String? qty;
  String? noitem;
  String? berat;
  String? ignored;
  String? catatan;
  String? feedbackCanSkipped;
  String? disc;
  String? disc2;
  String? disc3;
  String? discValuePost;

  Detail(
      {this.kodenota,
        this.kodemenu,
        this.namamenu,
        this.groupModifier,
        this.harga,
        this.gambar,
        this.modifier,
        this.qty,
        this.noitem,
        this.berat,
        this.ignored,
        this.catatan,
        this.feedbackCanSkipped,
        this.disc,
        this.disc2,
        this.disc3,
        this.discValuePost});

  Detail.fromJson(Map<String, dynamic> json) {
    kodenota = json['kodenota'];
    kodemenu = json['kodemenu'];
    namamenu = json['namamenu'];
    groupModifier = json['GroupModifier'];
    harga = json['harga'];
    gambar = json['gambar'];
    modifier = json['modifier'];
    qty = json['qty'];
    noitem = json['noitem'];
    berat = json['berat'];
    ignored = json['ignored'];
    catatan = json['catatan'];
    feedbackCanSkipped = json['FeedbackCanSkipped'];
    disc = json['Disc'];
    disc2 = json['Disc2'];
    disc3 = json['Disc3'];
    discValuePost = json['DiscValuePost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kodenota'] = this.kodenota;
    data['kodemenu'] = this.kodemenu;
    data['namamenu'] = this.namamenu;
    data['GroupModifier'] = this.groupModifier;
    data['harga'] = this.harga;
    data['gambar'] = this.gambar;
    data['modifier'] = this.modifier;
    data['qty'] = this.qty;
    data['noitem'] = this.noitem;
    data['berat'] = this.berat;
    data['ignored'] = this.ignored;
    data['catatan'] = this.catatan;
    data['FeedbackCanSkipped'] = this.feedbackCanSkipped;
    data['Disc'] = this.disc;
    data['Disc2'] = this.disc2;
    data['Disc3'] = this.disc3;
    data['DiscValuePost'] = this.discValuePost;
    return data;
  }
}