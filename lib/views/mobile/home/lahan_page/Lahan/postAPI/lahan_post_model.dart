// @dart=2.9
import 'dart:convert';

import 'dart:ffi';

LahanModel lahanModelFromJson(String str) =>
    LahanModel.fromJson(json.decode(str));

String lahanModelToJson(LahanModel data) => json.encode(data.toJson());

class LahanModel {
  String nama_lahan;
  Double param1, luas_lahan_klonal, luas_lahan_total, luas_lahan_seedling;

  LahanModel({
    this.nama_lahan,
    this.param1,
    this.luas_lahan_klonal,
    this.luas_lahan_total,
    this.luas_lahan_seedling,
  });

  factory LahanModel.fromJson(Map<String, dynamic> json) => LahanModel(
        nama_lahan: json["name"],
        param1: json["job"],
        luas_lahan_total: json["id"],
        luas_lahan_seedling: (json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "Nama lahan": nama_lahan,
        "Luas lahan klonal": luas_lahan_klonal.toString(),
        "Luas lahan total": luas_lahan_total.toString(),
        "Luas lahan seedling": luas_lahan_seedling.toString(),
        "Kemiringan": param1.toString(),
      };
}
