import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swiggy_ui/views/mobile/home/Lahan/dataAPI/prediksi.dart';

class PrediksiRepository{
List<Prediksi> _prediksi = <Prediksi>[];

static Future<List<Prediksi>> fetchPrediksi(int currentPage) async {
  final response =
      await http.get(Uri.parse('http://agriradar.id/api/web/v1/lahans/prediksi-pupuk?id_lahan=101' ));
  var prediksi = <Prediksi>[];
  if (response.statusCode == 200) {
    var prediksiJson = json.decode(response.body);
    for (var predikJson in prediksiJson['items']) {
      prediksi.add(Prediksi.fromJson(predikJson));
    }
  }
  return prediksi;
}
}