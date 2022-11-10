import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    //this.tipo = 'geo';
    if (valor != null) {
      if (valor.contains('http')) {
        this.tipo = 'http';
      } else {
        this.tipo = 'geo';
      }
    }
  }

  int? id;
  String? tipo;
  String valor;

  LatLng getLatLng() {
    var lat = 0.0;
    var lng = 0.0;
    if (valor != -1) {
      final latLng = this.valor.substring(4).split(',');
      lat = double.parse(latLng[0]);
      lng = double.parse(latLng[1]);
    }

    return LatLng(lat, lng);
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
