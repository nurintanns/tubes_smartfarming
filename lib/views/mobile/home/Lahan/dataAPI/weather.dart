import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Weather {
  final String name;
  final String region;
  final String country;
  final String tz_id;
  final String localtime;
  final String temp_c;
  final String text;

  Weather({
    required this.name,
    required this.region,
    required this.country,
    required this.tz_id,
    required this.localtime,
    required this.temp_c,
    required this.text,
  });

  static Future<Weather> fetchWeather()async{
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=b7cbd33f254e453480653325212212&q=Manado&aqi=yes'));
    Weather weather= new Weather(name: '', region: '', country: '', tz_id: '', localtime: '', temp_c: '', text: '');
    if (response.statusCode == 200) {
      var weatherJson = json.decode(response.body);
        weather = Weather.fromJson(weatherJson['location'], weatherJson['current'] );   
    print(weather);
    return weather;
  }
  factory Weather.fromJson(Map<String, dynamic> json, Map<String, dynamic> jsonCurrent) {
    return Weather(
      name: json['name'],
      region: json['region'].toString(),
      country: json['country'].toString(),
      tz_id: json['tz_id'].toString(),
      localtime: json['localtime'].toString(),
      
    );
    }

}
 /* static Future<Weather> fetchWeather() async {
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=b7cbd33f254e453480653325212212&q=Manado&aqi=yes'));
    Weather weather= new Weather(name: '', region: '', country: '', tz_id: '', localtime: '', temp_c: '', text: '');
    if (response.statusCode == 200) {
      var weatherJson = json.decode(response.body);
        weather = Weather.fromJson(weatherJson['location'], weatherJson['current'] );   
    print(weather);
    return weather;
  }
  factory Weather.fromJson(Map<String, dynamic> json, Map<String, dynamic> jsonCurrent) {
    return Weather(
      name: json['name'],
      region: json['region'].toString(),
      country: json['country'].toString(),
      tz_id: json['tz_id'].toString(),
      localtime: json['localtime'].toString(),
      temp_c: json['condition']['temp_c'].toString(),
      text: json['condition']['text'],
    );

  }

 factory Weather.fromJson(Map<String, dynamic> json, Map<String, dynamic> jsonCurrent) {
    return Weather(
      name: json['name'],
      region: json['region'].toString(),
      country: json['country'].toString(),
      tz_id: json['tz_id'].toString(),
      localtime: json['localtime'].toString(),
      temp_c: json['condition']['temp_c'].toString(),
      text: json['condition']['text']
    );  
  }
  factory Weather.fromJson(Map<String, dynamic> json, Map<String, dynamic> jsonCurrent) {
    return Weather(
      nama_lahan: json['nama_lahan'],
      n: json['N'].toString(),
      p: json['P'].toString(),
      k: json['K'].toString(),
      tempc: jsonCurrent['condition']['text'].toString(),
      text: jsonCurrent['condition']['text'].toString(),
    );
    
  }
}*/