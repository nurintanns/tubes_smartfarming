// @dart=2.9
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Lahan {
  String nama_lahan;
  Double param1, luas_lahan_total, luas_lahan_seedling;

  Lahan({this.nama_lahan, this.param1, this.luas_lahan_total, this.luas_lahan_seedling, });

  factory Lahan.createLahan(Map<String, dynamic> object) {
    return Lahan(
        nama_lahan: object['nama_lahan'],
        param1: object['param1'],
        luas_lahan_total: object['luas_lahan_total'],
        luas_lahan_seedling: object['luas_lahan_seedling']);
  }

    static Future<Lahan> connectToAPI(String id) async
  {
    Uri apiURL =Uri.parse("http://agriradar.id/api/web/v1/lahans/post-lahan" );

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var lahanData = (jsonObject as Map<String, dynamic>)['data'];

    return Lahan.createLahan(lahanData);
    
  }

}
