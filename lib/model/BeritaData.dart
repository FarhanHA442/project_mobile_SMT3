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
}
