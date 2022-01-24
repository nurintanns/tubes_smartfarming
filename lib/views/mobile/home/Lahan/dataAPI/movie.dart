class Movie {
  final int id_lahan;
  final double luas_lahan_total;
  final String nama_lahan;
  final String luas_lahan_klonal;
  final double luas_lahan_seedling;
  final String param1;
  final String param2;
  final String param3;
  final String param4;
  final String param5;
  final String rekomendasi1;
  final String rekomendasi2;
  final String rekomendasi3;
  final String rekomendasi4;
  final String param2_timestamp;
  final String param3_timestamp;
  final String param4_timestamp;
  final String param5_timestamp;
  final String notifikasi_param;
  final String notifikasi_message;

  Movie({
    required this.id_lahan,
    required this.nama_lahan,
    required this.luas_lahan_total,
    required this.luas_lahan_klonal,
    required this.luas_lahan_seedling,
    required this.param1,
    required this.param2,
    required this.param3,
    required this.param4,
    required this.param5,
    required this.rekomendasi1,
    required this.rekomendasi2,
    required this.rekomendasi3,
    required this.rekomendasi4,
    required this.param2_timestamp,
    required this.param3_timestamp,
    required this.param4_timestamp,
    required this.param5_timestamp,
    required this.notifikasi_param,
    required this.notifikasi_message,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    double luas_lahan_seedling = 0.0;
    if (json['luas_lahan_seedling'] != null) {
      luas_lahan_seedling =
          double.parse(json['luas_lahan_seedling'].toString());
    }
    return Movie(
        id_lahan: json['id_lahan'],
        nama_lahan: json['nama_lahan'],
        luas_lahan_total: double.parse(json['luas_lahan_total'].toString()),
        luas_lahan_klonal: json['luas_lahan_klonal'].toString(),
        luas_lahan_seedling: luas_lahan_seedling,
        param1: json['param1'],
        param2: (json['param2'] ?? ''),
        param3: json['param3'],
        param4: json['param4'],
        param5: json['param5'],
        rekomendasi1: json['rekomendasi1'],
        rekomendasi2: json['rekomendasi2'],
        rekomendasi3: json['rekomendasi3'],
        rekomendasi4: json['rekomendasi4'],
        param2_timestamp: json['param2_timestamp'],
        param3_timestamp: json['param3_timestamp'],
        param4_timestamp: json['param4_timestamp'],
        param5_timestamp: json['param5_timestamp'],
        notifikasi_param: json['notifikasi_param'],
        notifikasi_message: json['notifikasi_message']);
  }
}
