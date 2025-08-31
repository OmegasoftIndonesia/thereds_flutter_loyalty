class promoResponse {
  String? link;
  String? id;
  String? aktif;
  String? tglentry;
  String? promo;
  String? warna;
  String? kodeBarang;
  String? tipe;
  String? judul;
  String? isi;
  String? font;
  String? jenis;
  String? gambardetail;
  String? tglmulai;
  String? tglakhir;
  String? disc;
  String? discinnominal;
  String? minpurchase;

  promoResponse(
      {this.link,
        this.id,
        this.aktif,
        this.tglentry,
        this.promo,
        this.warna,
        this.kodeBarang,
        this.tipe,
        this.judul,
        this.isi,
        this.font,
        this.jenis,
        this.gambardetail,
        this.tglmulai,
        this.tglakhir,
        this.disc,
        this.discinnominal,
        this.minpurchase});

  promoResponse.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    id = json['id'];
    aktif = json['aktif'];
    tglentry = json['tglentry'];
    promo = json['promo'];
    warna = json['warna'];
    kodeBarang = json['kode_barang'];
    tipe = json['tipe'];
    judul = json['judul'];
    isi = json['isi'];
    font = json['font'];
    jenis = json['jenis'];
    gambardetail = json['gambardetail'];
    tglmulai = json['tglmulai'];
    tglakhir = json['tglakhir'];
    disc = json['disc'];
    discinnominal = json['discinnominal'];
    minpurchase = json['minpurchase'];
  }

  List<promoResponse> parseResponse(List<dynamic> jsonList) {
    return jsonList.map((e) => promoResponse.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['id'] = this.id;
    data['aktif'] = this.aktif;
    data['tglentry'] = this.tglentry;
    data['promo'] = this.promo;
    data['warna'] = this.warna;
    data['kode_barang'] = this.kodeBarang;
    data['tipe'] = this.tipe;
    data['judul'] = this.judul;
    data['isi'] = this.isi;
    data['font'] = this.font;
    data['jenis'] = this.jenis;
    data['gambardetail'] = this.gambardetail;
    data['tglmulai'] = this.tglmulai;
    data['tglakhir'] = this.tglakhir;
    data['disc'] = this.disc;
    data['discinnominal'] = this.discinnominal;
    data['minpurchase'] = this.minpurchase;
    return data;
  }
}