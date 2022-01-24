// @dart=2.9
import 'package:http/http.dart' as http;
import 'dart:convert';

class Prediksi {
  final String nama_lahan;
  final String n;
  final String p;
  final String k;
  final String Mg;

  Prediksi({this.nama_lahan,
    this.n,
    this.p,
    this.k,
    this.Mg, });

  factory Prediksi.createPrediksi(Map<String, dynamic> object) {
    return Prediksi(
        nama_lahan: object['nama_lahan'],
        n: object['n'],
        p: object['p'],
        k: object['k'],
        Mg: object['Mg']);
  }

    static Future<Prediksi> connectToAPI(String id) async
  {
    Uri apiURL =Uri.parse("http://agriradar.id/api/web/v1/lahans/prediksi-pupuk?id_lahan=101");

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var prediksiData = (jsonObject as Map<String, dynamic>)['data'];

    return Prediksi.createPrediksi(prediksiData);
    
  }

}
