import 'dart:convert';

import 'package:http/http.dart' as http;

class Prediksi {
  final String nama_lahan;
  final String n;
  final String p;
  final String k;
  final String mg;

  Prediksi({
    required this.nama_lahan,
    required this.n,
    required this.p,
    required this.k,
    required this.mg,
  });
  static Future<Prediksi> fetchPrediksi(int id_lahan) async {
    print(id_lahan);
    final response = await http.get(Uri.parse(
        'http://agriradar.id/api/web/v1/lahans/prediksi-pupuk?id_lahan=' + id_lahan.toString()));
    Prediksi prediksi= new Prediksi(nama_lahan: '', n: '', p: '', k: '', mg: '');
    if (response.statusCode == 200) {
      var prediksiJson = json.decode(response.body);
        prediksi = Prediksi.fromJson(prediksiJson['items'], );   
    }
    print(prediksi);
    return prediksi;
  }

  factory Prediksi.fromJson(Map<String, dynamic> json) {
    return Prediksi(
      nama_lahan: json['nama_lahan'],
      n: json['N'].toString(),
      p: json['P'].toString(),
      k: json['K'].toString(),
      mg: json['Mg'].toString(),
    );  
  }
}
