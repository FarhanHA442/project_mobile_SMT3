class BeritaData {
  late String data;
  late List<BeritaDataList> beritaList;

  BeritaData({
    required this.data,
    required this.beritaList,
  });

  BeritaData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      beritaList = <BeritaDataList>[];
      json['data'].forEach((v) {
        beritaList.add(new BeritaDataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    if (this.beritaList != null) {
      data['beritaList'] = this.beritaList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BeritaDataList {
  late String idBerita;
  late String judul;
  late String tanggal_berita;
  late String thumbnail_berita;
  late String deskripsi_berita;
  late String status_berita;

  BeritaDataList({
    required this.idBerita,
    required this.judul,
    required this.tanggal_berita,
    required this.thumbnail_berita,
    required this.deskripsi_berita,
    required this.status_berita,
  });

  BeritaDataList.fromJson(Map<String, dynamic> json) {
    idBerita = json['id_berita'];
    judul = json['judul'];
    tanggal_berita = json['tanggal_berita'];
    thumbnail_berita = json['thumbnail_berita'];
    deskripsi_berita = json['deskripsi'];
    status_berita = json['status_berita'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_berita'] = this.idBerita;
    data['judul'] = this.judul;
    data['tanggal_berita'] = this.tanggal_berita;
    data['thumbnail_berita'] = this.thumbnail_berita;
    data['deskripsi_berita'] = this.deskripsi_berita;
    data['status_berita'] = this.status_berita;
    return data;
  }
}
